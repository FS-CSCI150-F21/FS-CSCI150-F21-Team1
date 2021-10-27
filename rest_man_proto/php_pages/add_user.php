<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";



$jsonarray = $_POST['userinfo'];

$decoded = json_decode($jsonarray, true);

$firstname = $decoded['f_name'];
$lastname = $decoded['l_name'];
$username = $decoded['username'];
$password = $decoded['password'];
$userlevel = $decoded['level'];
$userphone = $decoded['phone'];
$useremail = $decoded['email'];
$userposition = $decoded['position'];
$userwage = $decoded['wage'];

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


$sql = "SELECT username FROM user_info where username='$username'";

$results = $conn->query($sql);

$exists = $results->num_rows;

if ($exists > 0)
{
    echo "0";
}
else
{
    $sql = "INSERT INTO user_info (first_name, last_name, username, password, level, phone, email, position, wage) 
    VALUES ('$firstname','$lastname','$username','$password','$userlevel', '$userphone', '$useremail', '$userposition', '$userwage');";
    echo "1";
}

if ($conn->query($sql) !== FALSE) {
  } 
else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }
  
$conn->close();


?>