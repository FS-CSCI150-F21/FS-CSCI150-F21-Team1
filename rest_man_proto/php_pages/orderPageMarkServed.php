<?php

require 'mysqlConnection.php';

session_start();

//

if($_POST['orderId']!=$_SESSION['order']){
    return;
}

$orderId = isset($_POST['orderId'])?$_POST['orderId']:30;

//update record in database, and check paid status through multiquery
$query = 'UPDATE open_order_info SET status="Served" '
        . 'WHERE order_id=' . $orderId . ';';

$query .= 'SELECT paid FROM open_order_info '
        . 'WHERE order_id=' . $orderId . ';';

//debug
//echo $query;

//execute queries
$conn->multi_query($query);

//skip the update query result
$conn->next_result();

//echo $conn->info;
/*
$resultSet = $conn->store_result();
echo $resultSet->num_rows . ' rows';
$obj = $resultSet->fetch_object();
echo $obj->paid;
*/

if($result = $conn->store_result()){
    //success
    //check to see if order has been paid
    if($result->fetch_object()->paid){
        echo 'success';
        //Customer has received food and paid for it. Set order status to 'Closed' 
        // and move order record from open_order_info to closed_order_info
        $multiquery = 'UPDATE open_order_info SET status="Closed" WHERE order_id='
            . $orderId . '; ';
        $multiquery .= 'INSERT INTO closed_order_info SELECT * 
                        FROM open_order_info 
                        WHERE order_id=' . $orderId . '; ';
        $multiquery .= 'DELETE FROM open_order_info WHERE order_id=' . $orderId . ';';

        if ($conn->multi_query($multiquery)) {
            //success

        } else {
            //query failure
            echo $conn->error;
        }
    }
}
else{
    echo 'error: ' . $conn->error;
}

$conn->close();