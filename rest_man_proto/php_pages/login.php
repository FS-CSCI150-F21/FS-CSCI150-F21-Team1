<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

$playerusername = $_POST['u'];
$playerpassword = $_POST['p'];
$userlevel = $_POST['l'];

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}



$sql = "SELECT first_name, username, password, level FROM user_info where username='$playerusername' AND password='$playerpassword' AND level='$userlevel'";

$results = $conn->query($sql);

$exists = $results->num_rows;

if ($exists > 0)
{
    echo "Logged in.";
}
else
{
  echo "Incorrect username, password, or user level";
}

if ($conn->query($sql) !== FALSE) {
  } 
else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }
  
if($exists==1)
{
    session_start();
    $a= mysqli_fetch_assoc($results);
    $_SESSION['loggedin'] = true;
    $_SESSION['username'] = $playerusername;
    $_SESSION['first_name'] = $a['first_name'];
    $_SESSION['level'] = $userlevel;

}

$conn->close();


?>