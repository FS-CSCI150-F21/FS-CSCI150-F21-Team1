<?php

//this is a script to test mysql tunnel connection through ngrok

//mySQL server authentication details
$servername = "0.tcp.ngrok.io:16677";
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

echo $conn->connect_error;

$query = 'SELECT * FROM open_order_info;';
echo $query . '<br>';

$result = $conn->query($query);

if($result->num_rows){
    echo 'success';
    $resultArr = $result->fetch_all();
    foreach($resultArr as $row){
        foreach($row as $attribute){
            echo $attribute . ', ';
        }
        echo '<br>';
    }
}
else{
    echo 'error: ' . $conn->error;
    $conn->host_info;
}


?>