<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";


$itemName = $_POST['i'];
$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}




$sql = "DELETE FROM `inventory` WHERE name='$itemName'";

$results = $conn->query($sql);
if($results == 1)
{
  echo "Deleted item named \"" . $itemName ."\"";
}
else
{
  echo "Cannot delete item";
}
return;


$conn->close();


?>