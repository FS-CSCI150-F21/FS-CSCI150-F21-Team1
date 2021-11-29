<?php

require 'mysqlConnection.php';

//logged in and permission check
session_start();

if($_SESSION['order']!=$_POST['orderId']){
    //someone has accessed this page without authorization
    return;
}

$dinerTable = isset($_POST['tblNum'])?$_POST['tblNum']:10;

$query = 'UPDATE open_order_info SET dinerTable=' . $dinerTable 
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