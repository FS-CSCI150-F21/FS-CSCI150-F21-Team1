<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";



$jsonarray = $_POST['msg_obj'];

$decoded = json_decode($jsonarray, true);

$name = $decoded['name'];
$email = $decoded['email'];
$subject = $decoded['subject'];
$msg = $decoded['msg'];

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}



$sql = "INSERT INTO messages (name, email, subject, mes) 
VALUES ('$name','$email','$subject','$msg');";


if ($conn->query($sql) !== FALSE) {
  } 
else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }
  
$conn->close();


?>