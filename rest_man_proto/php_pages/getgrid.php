<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";


$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


$sql = "SELECT numberof,grid FROM tablegrid where id=1 ";

$results = $conn->query($sql);

$exists = $results->num_rows;

$rows = $results->fetch_assoc();

$test = new stdClass();
$test->numberof = $rows["numberof"];
$test->grid = unserialize($rows["grid"]);

if ($exists > 0)
{
    echo json_encode($test);
}
else
{
    echo "0";
}

if ($conn->query($sql) !== FALSE) {} 
else {echo "Error: " . $sql . "<br>" . $conn->error;}
  
$conn->close();

?>