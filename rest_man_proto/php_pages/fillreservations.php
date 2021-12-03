<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

if (isset($_POST['empty']))
{
    $jsoncoords = $_POST['empty'];
    $coords = json_decode($jsoncoords);
    $serialized = serialize($coords);

    $conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);
    
    if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
    }
    
    $sql = "UPDATE table_info SET reservations = '$serialized'";
    $sql2= "UPDATE user_info SET reservation_info = null";
    if ($conn->query($sql) !== FALSE) {
        
    } 
    else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    if ($conn->query($sql2) !== FALSE) {
        
    } 
    else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    echo "here";




    $conn->close();

}



?>