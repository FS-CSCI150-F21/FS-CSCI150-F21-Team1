<?php


require 'mysqlConnection.php';

session_start();

//user needs new order
//create insert query for mysql database
$query = "INSERT INTO open_order_info (username) VALUES
            ('" . $_SESSION['username'] . "');";

//ask query of mysql database
$queryResult = $conn->query($query);

//retrieve automatically-incremented value of order number upon record creation.
$orderNumber = $conn->insert_id;

//store order number in session
$_SESSION['order'] = $orderNumber;

//let client know which new order was created
echo $orderNumber;

