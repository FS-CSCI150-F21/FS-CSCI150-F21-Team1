<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

$firstname = $_POST['fn'];
$lastname = $_POST['ln'];
$playerusername = $_POST['u'];
$playerpassword = $_POST['p'];
$userlevel = 2;

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}



$sql = "SELECT username FROM user_info where username='$playerusername'";

$results = $conn->query($sql);

$exists = $results->num_rows;

if ($exists > 0)
{
    echo "0";
}
else
{
    $sql = "INSERT INTO user_info (first_name, last_name, username, password, level) 
    VALUES ('$firstname','$lastname','$playerusername','$playerpassword','$userlevel');";
    echo "1";
}

if ($conn->query($sql) !== FALSE) {
  } 
else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }
  
$conn->close();


?>