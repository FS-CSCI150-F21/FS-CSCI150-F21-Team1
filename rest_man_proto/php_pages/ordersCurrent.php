<?php

require 'mysqlConnection.php';

//ensure the user is logged in and at least of employee privilege level
session_start();



$orderNumber = isset($_POST['orderNumber'])?$_POST['orderNumber']:false;

if($orderNumber){
    //change session order number
    echo $_SESSION['order'] . '<br>';
    $_SESSION['order']=$orderNumber;
    //echo $orderNumber;
    echo $_SESSION['order'];
}
else{
    //get open orders

    //build query
    $query = 'SELECT * FROM open_order_info;';

    $result=$conn->query($query);

    if($result->num_rows){
        //success
        $resultArr = $result->fetch_all(true);
        echo json_encode($resultArr);
    }
    else{
        echo 'error: ' . $conn->error;
    }
    $conn->close();
}
