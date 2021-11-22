<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";


$itemName = $_POST['i'];
$status = $_POST['s'];
$loggedIn = $_POST['lI'];

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


$sql = "DELETE FROM `employee_time` WHERE name='$itemName' AND status='$status' AND time_loggedIn= '$loggedIn'";

$results = $conn->query($sql);
if($results == 1)
{
  $a = 'Deleted lock-'. $status .' item.';
  echo $a;
}
else
{
  echo "Cannot delete item";
}
return;


$conn->close();


?>