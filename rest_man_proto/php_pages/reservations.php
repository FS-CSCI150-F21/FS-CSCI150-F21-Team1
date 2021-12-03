<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

$tableid = $_POST['id'];

$jsoncoords = $_POST['res'];
$coords = json_decode($jsoncoords);
$serialized = serialize($coords);

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


$sql = "UPDATE table_info SET reservations='$serialized' WHERE id = '$tableid';";
echo $jsoncoords;

if ($conn->query($sql) !== FALSE) {} 
else {echo "Error: " . $sql . "<br>" . $conn->error;}




  


$conn->close();


?>