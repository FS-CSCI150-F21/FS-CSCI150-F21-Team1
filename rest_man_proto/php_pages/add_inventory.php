<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";



$jsonarray = $_POST['inventory'];

$decoded = json_decode($jsonarray, true);

$name = $decoded['name'];
$currentQuantity = $decoded['currentQuantity'];
$requiredQuantity = $decoded['requiredQuantity'];
// $lastupdate = $decoded['lastupdate'];

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


 $sql = "SELECT name FROM inventory;";

 $results = $conn->query($sql);

 $exists = $results->num_rows;

 while($row = $results->fetch_assoc())
 {
  if($row['name']==$name)
  {
    echo "0";
    return;
  }
 }

    $sql = "INSERT INTO inventory(name, currentQuantity, requiredQuantity) VALUES ('$name','$currentQuantity','$requiredQuantity');";
    echo "1";


if ($conn->query($sql) !== FALSE) {
  } 
else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }
  
$conn->close();


?>