<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";


if(isset( $_POST['u'])){
  $playerusername =  $_POST['u'];
} 



$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}



$sql = "SELECT username FROM messages where username='$playerusername'";

$results = $conn->query($sql);

$exists = $results->num_rows;

if ($exists < 1)
{
    echo "Cannot delete";
}
else
{
    $sql = "DELETE FROM messages WHERE username='$playerusername'";
    echo "Successfully deleted message";
}

if ($conn->query($sql) !== FALSE) {
  } 
else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }
  
$conn->close();


?>