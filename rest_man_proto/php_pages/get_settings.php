<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


$sql = "SELECT name,location,open_time,close_time,days FROM rest_settings where id=1";
$results = $conn->query($sql);
$exists = $results->num_rows;
$rows = $results->fetch_assoc();
$test = new stdClass();
$test->name = $rows["name"];
$test->location = $rows["location"];
$test->open_time = $rows["open_time"];
$test->close_time = $rows["close_time"];
$test->days = unserialize($rows["days"]);

echo json_encode($test);



if ($conn->query($sql) !== FALSE) {} 
else {
echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();


?>