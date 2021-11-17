<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";


$itemName = $_POST['i'];
$currentQuantity = $_POST['cQ'];
$requiredQuantity = $_POST['rQ'];
$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}




$sql = "UPDATE `inventory` SET `name`='$itemName',`currentQuantity`='$currentQuantity',`requiredQuantity`='$requiredQuantity',`lastupdate`=NOW() WHERE name='$itemName'";

$results = $conn->query($sql);
if($results == 1)
{
  echo "Edited item named \"" . $itemName ."\"";
}
else
{
  echo "Cannot edit item";
}
return;


$conn->close();


?>