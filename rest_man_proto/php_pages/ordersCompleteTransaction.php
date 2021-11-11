<?php

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
        //echo $this->id . ' has pTime of ' . $this->prepTime . '<br>';
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

//mySQL server authentication details
$servername = "127.0.0.1";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

//establish connection
$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

//verify connection
if ($conn->connect_error) {
    echo 'not connected to mysql server';
    exit('Could not connect');
}

//echo time() . '<br>';

session_start();

$userStatus = isset($_SESSION['loggedin']) ? $_SESSION['loggedin'] : false;

if (!$userStatus) {
    echo 'no user logged-in';
    return;
}


/*
$test = isset($_POST['paid'])?'true':'false';
echo $test;
*/
//possible statuses: Opened, Kitchen, Prepared, Served, Closed

//in order to reach this point, user should have a session order assigned already
//11 is for testing purposes
$orderNumber = isset($_SESSION['order']) ? $_SESSION['order'] : 11;

//build query to modify paid field of order
$query = 'UPDATE order_info SET paid=1 WHERE number=' . $orderNumber . ';';

if ($conn->query($query)) {
    //echo $orderNumber;
    //check status and this user's privilege level to determine next status
    $query = 'SELECT status, items FROM order_info WHERE number=' . $orderNumber . ';';
    $result = $conn->query($query);
    $resultObj = $result->fetch_object();
    $status = $resultObj->status;

    $userLevel = isset($_SESSION['loggedin']) ? $_SESSION['level'] : -1;
    //echo $userLevel;
    //echo $status;
    if ($userLevel == 2 && $status == 'Opened') {
        //update MySQL record status to 'Kitchen'
        $query = 'UPDATE order_info SET status="Kitchen" WHERE number='
            . $orderNumber . ';';
        if ($conn->query($query)) {
            //success
            //return wait time
            $items = json_decode($resultObj->items);
            //echo $resultObj->items;
            $order = array();
            foreach ($items as $id => $qty) {
                $order[] = new item($id, $qty);
            }
            $query = "SELECT id, prep_time FROM menuItems WHERE ";
            for ($i = 0; $i < count($order) - 1; $i++) {
                $query .= 'id=' . $order[$i]->getID() . ' OR ';
            }
            //echo 'test';
            //echo count($order);
            $query .= 'id=' . $order[count($order) - 1]->getID() . ';';
            //echo $query;
            if ($result = $conn->query($query)) {
                $prepTimes = $result->fetch_all();
                //echo $prepTimes;
                for ($i = 0; $i < count($order); $i++) {
                    $order[$i]->addPrepTime($prepTimes[$i][0], $prepTimes[$i][1]);
                }
                //echo getOrderPrepTime($order);
                //set estimated ready time (eRTime column)
                $oPrepTime = getOrderPrepTime($order);
                $eRTime = date('Y-m-d H:i:s', (($oPrepTime * 60) + time()));
                //$eRTime = 
                
                $query = 'UPDATE order_info SET eRTime="' . $eRTime
                    . '" WHERE number=' . $orderNumber . ';';
                if ($conn->query($query)) {
                    //everthing worked
                    $return = array($eRTime,$oPrepTime);

                    echo json_encode($return);
                } else {
                    echo $conn->error;
                }
            } else {
                die('something is wrong');
            }
        } else {
            die('something is wrong');
        }
    } else if ($userLevel == 2 && $status == 'Served') {
        $query = 'UPDATE order_info SET status="Closed" WHERE number='
            . $ordeNumber . ';';
        //return wait time of 0
        echo 0;
    }
} else {
    //database error
    echo $conn->error;
}

$conn->close();
