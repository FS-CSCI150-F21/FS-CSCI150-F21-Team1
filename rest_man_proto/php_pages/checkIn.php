<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";



// $name = $_POST['name'];
$status = $_POST['status'];
echo $status;
echo "1";

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


 session_start();
 $name= $_SESSION['username'];

 $sql = "INSERT INTO `employee_time`(`name`, `Status`) VALUES ('$name','$status');";

 $results = $conn->query($sql);

 $exists = $results->num_rows;


?>