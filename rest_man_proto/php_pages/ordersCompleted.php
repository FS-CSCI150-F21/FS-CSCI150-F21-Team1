<?php

require 'mysqlConnection.php';

session_start();

//verify user is logged in and a manager
//security: authorization
if($_SESSION['loggedin']!=1 && $_SESSION['level']!=0){
    echo 'user is not logged in, or is not a manager.';
    return;
}

/*
foreach($_SESSION as $key => $val){
    echo $key . ': ' . $val . '<br>';
}
*/

//get all records from table 'closed_order_info'
$query = 'SELECT * FROM closed_order_info;';

if($result=$conn->query($query)){
    echo json_encode($result->fetch_all(MYSQLI_ASSOC));
}
else if($conn->error){
    echo $conn->error;
}


?>