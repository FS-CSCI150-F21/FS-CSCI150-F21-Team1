<?php

require 'mysqlConnection.php';

//this will update an order record's status field to Kitchen
session_start();

$orderID = isset($_SESSION['order'])?$_SESSION['order']:false;

/*
echo $_SESSION['order'] . '<br>';
echo $_SESSION['username'];
$SESSIONKeys = array_keys($_SESSION);
echo $SESSIONKeys;

foreach($SESSIONKeys as $key=>$val){
    echo $key . '=>' . $val . '<br>';
}

echo $orderID;
*/


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
    echo true;
}
else{
    //debug
    //echo $conn->error;
    echo false;
}

$conn->close();

?>