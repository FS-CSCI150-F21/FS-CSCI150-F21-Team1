<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

$jsonarray = $_POST['tables'];

$decoded = json_decode($jsonarray, true);

$length = count($decoded);


$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "DELETE FROM table_info;";
$conn->query($sql);


for($i = 0; $i < $length; $i++){
    $id = $decoded[$i]["id"];
    $capacity = $decoded[$i]["capacity"];
    $sql = "INSERT INTO table_info (id, capacity) VALUES ('$id', '$capacity');";
    $conn->query($sql);
}

$test = $decoded[1]["id"];
$test2 = $decoded[1]["capacity"];



  


$conn->close();


?>
