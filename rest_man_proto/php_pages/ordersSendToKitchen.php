<?php
//this will simply update an order record's status field to Kitchen

//order id, item id, quantity

require 'mysqlConnection.php';

session_start();

$orderID = isset($_SESSION['order'])?$_SESSION['order']:false;

//build query
$query = 'UPDATE open_order_info SET status="Kitchen" '
    . 'WHERE order_id=' . $orderID . ';';

//echo $query;


//execute query
$result = $conn->query($query);

//check for any problems with query execution
if($result){
    //debug
    //echo $conn->info;
    //echo true;

    //get items to update kitchen table
    $query = 'SELECT items FROM open_order_info WHERE order_id=' . $orderID . ';';

    if($result = $conn->query($query)){
        $itemsStr = $result->fetch_object()->items;
        $itemsObj = json_decode($itemsStr);
        //echo $itemsStr;
        $items = array();
    }

    //update kitchen table with prepare statement
    $query = 'INSERT INTO kitchen (order_id, item_id, quantity) ' 
            . 'VALUES (' . $orderID . ',?,?);';

    $statement = $conn->prepare($query);

    $statement->bind_param("ii",$id,$qty);

    foreach($itemsObj as $id=>$qty){
        if($statement->execute()){
            //success
            echo 'inserted ' . $orderID . ', ' . $id . ', ' . $qty . '<br>';
        }
        else{
            echo 'error: ' . $statement->error;
        }
    }

    $statement->close();

}
else{
    //debug
    //echo $conn->error;
    echo false;
}

$conn->close();



?>
