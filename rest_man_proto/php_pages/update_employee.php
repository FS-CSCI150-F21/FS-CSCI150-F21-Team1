<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";


$fname = $_POST['fname'];
$lname = $_POST['lname'];
$email = $_POST['email'];
$position = $_POST['position'];
$wage = $_POST['wage'];
$phone = $_POST['phone'];

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}




$sql = "UPDATE `user_info` SET `first_name`='$fname',`last_name`='$lname',`email`='$email',`position`='$position',`wage`='$wage',`phone`='$phone' WHERE first_name='$fname'";

$results = $conn->query($sql);
echo "Edited employee named \"" . $fname ."\"";


$conn->close();


?>