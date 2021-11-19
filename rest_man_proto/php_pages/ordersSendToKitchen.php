<?php
//this will simply update an order record's status field to Kitchen

//order id, item id, quantity

require 'mysqlConnection.php';

session_start();

$orderID = isset($_SESSION['order']) ? $_SESSION['order'] : false;

//build query
$query = 'UPDATE open_order_info SET status="Kitchen" '
    . 'WHERE order_id=' . $orderID . ';';

//echo $query;


//execute query
$result = $conn->query($query);

//check for any problems with query execution
if ($result) {
    //debug
    //echo $conn->info;
    //echo true;

    //set estimated ready time (eRTime)
    setERtime($conn, $orderID);


    //get items to update kitchen table
    $query = 'SELECT items FROM open_order_info WHERE order_id=' . $orderID . ';';

    if ($result = $conn->query($query)) {
        $itemsStr = $result->fetch_object()->items;
        $itemsObj = json_decode($itemsStr);
        //echo $itemsStr;
        $items = array();
    }

    //update kitchen table with prepare statement
    $query = 'INSERT INTO kitchen (order_id, item_id, quantity) '
        . 'VALUES (' . $orderID . ',?,?);';

    $statement = $conn->prepare($query);

    $statement->bind_param("ii", $id, $qty);

    foreach ($itemsObj as $id => $qty) {
        if ($statement->execute()) {
            //success
            echo 'inserted ' . $orderID . ', ' . $id . ', ' . $qty . '<br>';
        } else {
            echo 'error: ' . $statement->error;
        }
    }

    $statement->close();
} else {
    //debug
    //echo $conn->error;
    echo false;
}

$conn->close();



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
    function getQty()
    {
        return $this->quantity;
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

function setERTime($conn, $orderNumber)
{
    $query = 'SELECT status, items FROM open_order_info WHERE order_id=' . $orderNumber . ';';
    $result = $conn->query($query);
    $resultObj = $result->fetch_object(); //can combine this line and next

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
}
