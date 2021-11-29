<?php

require 'mysqlConnection.php';

//logged in and permission check
session_start();

echo $_SESSION['order'];
echo $_POST['orderId'];

if($_SESSION['order']!=$_POST['orderId']){
    //someone has accessed this page without authorization
    return;
}

$partySize = isset($_POST['partySize'])?$_POST['partySize']:5;

$query = 'UPDATE open_order_info SET people_dining_in=' . $partySize 
            . ' WHERE order_id=' . $_POST['orderId'] . ';';




//debug
//echo $query;

if($conn->query($query)){
    //success
    //echo 'success';
}
else{
    echo 'error: ' . $conn->error;
}

$conn->close();




?>