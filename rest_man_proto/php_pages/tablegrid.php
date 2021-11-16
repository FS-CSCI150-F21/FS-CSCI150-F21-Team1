<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

$amount = $_POST['number'];
$jsoncoords = $_POST['tcoords'];

$coords = json_decode($jsoncoords);
$serialized = serialize($coords);


$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}



$sql = "UPDATE tablegrid SET numberof='$amount', grid='$serialized' WHERE id = 1;";


if ($conn->query($sql) !== FALSE) {} 
else {echo "Error: " . $sql . "<br>" . $conn->error;}
  
echo $jsoncoords;

$conn->close();


?>