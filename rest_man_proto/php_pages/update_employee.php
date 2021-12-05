<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";


$originalfname = $_POST['fname'];
$fname1 = $_POST['fname1'];
$lname = $_POST['lname'];
$email = $_POST['email'];
$position = $_POST['position'];
$wage = $_POST['wage'];
$phone = $_POST['phone'];

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}




$sql = "UPDATE `user_info` SET `first_name`='$fname1',`last_name`='$lname',`email`='$email',`position`='$position',`wage`='$wage',`phone`='$phone' WHERE first_name='$originalfname'";
echo $sql;
$results = $conn->query($sql);
echo "Edited employee named \"" . $originalfname ."\"";


$conn->close();


?>