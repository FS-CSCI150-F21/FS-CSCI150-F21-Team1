<?php
session_start();
$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";


$tableid = $_POST['id'];

if(isset($_SESSION['username'])){
  $temp = $_SESSION['username'];
}

$j_reservation = $_POST['info'];
$user_reservation = json_decode($j_reservation);
$res_serial = serialize($user_reservation);


$jsoncoords = $_POST['res'];
$coords = json_decode($jsoncoords);
$serialized = serialize($coords);

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


$sql = "UPDATE table_info SET reservations='$serialized' WHERE id = '$tableid';";

echo $temp;

if ($conn->query($sql) !== FALSE) {} 
else {echo "Error: " . $sql . "<br>" . $conn->error;}


$sql2 = "UPDATE user_info SET reservation_info = '$res_serial' WHERE username = '$temp';";
$conn->query($sql2);
  


$conn->close();


?>