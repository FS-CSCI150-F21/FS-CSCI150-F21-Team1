<?php
session_start();
$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";



if(isset($_SESSION['username'])){
  $temp = $_SESSION['username'];
}


$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT reservation_info FROM user_info WHERE username = '$temp';";

$results = $conn->query($sql);

$exists = $results->num_rows;

$rows = $results->fetch_assoc();

$rows["reservation_info"] = unserialize($rows["reservation_info"]);


echo json_encode($rows);

if ($conn->query($sql) !== FALSE) {} 
else {echo "Error: " . $sql . "<br>" . $conn->error;}



  


$conn->close();


?>