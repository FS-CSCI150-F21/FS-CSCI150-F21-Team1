<?php

include 'mysqlConnection.php';

class item
{
    private $prepTime;
    private $quantity;
    private $id;
    function __construct($id, $quantity)
    {
        $this->id = $id;
        $this->quantity = $quantity;
    }
    function addPrepTime($id, $pTime)
    {
        if ($this->id == $id) {
            $this->prepTime = $pTime;
        }
    }
    function getID()
    {
        return $this->id;
    }
    function getPrepTime()
    {
        return $this->prepTime;
    }
}

function getOrderPrepTime($orderArr)
{
    $max = 0;
    foreach ($orderArr as $item) {
        if ($max < $item->getPrepTime()) $max = $item->getPrepTime();
    }
    if (count($orderArr) < $max) return $max;
    else return $max + count($orderArr) / 2;
}


session_start();

$userStatus = isset($_SESSION['loggedin']) ? $_SESSION['loggedin'] : false;

if (!$userStatus) {
    echo 'no user logged-in';
    return;
}

//in order to reach this point, user should have a session order assigned already
//11 is for testing purposes
$orderNumber = isset($_SESSION['order']) ? $_SESSION['order'] : 11;

//build query to modify paid field of order
$query = 'UPDATE open_order_info SET paid=1 WHERE order_id=' . $orderNumber . ';';

if ($conn->query($query)) {

    //check order's current status and this user's privilege level 
    // to determine next status
    $query = 'SELECT status, items FROM open_order_info WHERE order_id=' . $orderNumber . ';';
    $result = $conn->query($query);
    $resultObj = $result->fetch_object();//can combine this line and next
    $status = $resultObj->status;

    $userLevel = isset($_SESSION['loggedin']) ? $_SESSION['level'] : -1;

    //possible statuses: Opened, Kitchen, Prepared, Served, Closed
    if ($status == 'Opened') {
        //update MySQL record status to 'Kitchen'
        $query = 'UPDATE open_order_info SET status="Kitchen" WHERE order_id='
            . $orderNumber . ';';

        if ($conn->query($query)) {
            //success.  calculate and set estimated ready time.

            //get order items
            $items = json_decode($resultObj->items);

            //assign item ids and quantities to item class objects
            $order = array();
            foreach ($items as $id => $qty) {
                $order[] = new item($id, $qty);
            }
            //build query with recently grabbed item ids to acquire prep times
            $query = "SELECT id, prep_time FROM menuItems WHERE ";
            for ($i = 0; $i < count($order) - 1; $i++) {
                $query .= 'id=' . $order[$i]->getID() . ' OR ';
            }
            $query .= 'id=' . $order[count($order) - 1]->getID() . ';';

            //check success of query
            if ($result = $conn->query($query)) {
                //success

                //store results in an arary
                $prepTimes = $result->fetch_all();

                //assign prep times to respective item objects
                for ($i = 0; $i < count($order); $i++) {
                    $order[$i]->addPrepTime($prepTimes[$i][0], $prepTimes[$i][1]);
                }

                //calculate prep time with all item objects
                $oPrepTime = getOrderPrepTime($order);
                //calculate estimated ready time with addition of prep time to
                // current time
                $eRTime = date('Y-m-d H:i:s', (($oPrepTime * 60) + time()));

                //set estimated ready time (eRTime column)
                //set prep time column (for long's wait time algorithm)
                $query = 'UPDATE open_order_info SET eRTime="' . $eRTime
                    . '", prep_time=' . $oPrepTime
                    . ' WHERE order_id=' . $orderNumber . ';';
                if ($conn->query($query)) {
                    //everthing worked

                } else {
                    echo $conn->error;
                }
            } else {
                //MySQL query to get prep times of items went wrong.
                die('MySQL query to get prep times of items went wrong.');
            }
        } else {
            //MySQL query to change status to 'Kitchen' went wrong
            die('MySQL query to change status to "Kitchen" went wrong.');
        }
    } else if ($status == 'Served') {
        //Customer has received food and paid for it, regardless of which user type
        // completed the payment transaction.  Set order status to 'Closed' and move
        // order record from open_order_info to closed_order_info
        $multiquery = 'UPDATE open_order_info SET status="Closed" WHERE order_id='
            . $orderNumber . '; ';
        $multiquery .= 'INSERT INTO closed_order_info SELECT * 
                        FROM open_order_info 
                        WHERE order_id=' . $orderNumber . '; ';
        $multiquery .= 'DELETE FROM open_order_info WHERE order_id=' . $orderNumber . ';';

        if ($conn->multi_query($multiquery)) {
            //success

        } else {
            //query failure
            echo $conn->error;
        }
    } else {
        //status is set to 'Kitchen', 'Ready', or 'Closed'
        // eRTime should already be set
    }
} else {
    //database error
    echo $conn->error;
    echo 'connection error';
}

$conn->close();
