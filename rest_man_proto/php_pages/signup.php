<?php
$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

$playerusername = $_POST['u'];
$playerpassword = $_POST['p'];


$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT username FROM user_test where username='$playerusername'";

$results = $conn->query($sql);

$exists = $results->num_rows;

if ($exists > 0)
{
  echo "Username already exists";
}
else
{
  $sql = "INSERT INTO user_test (username, password)
          VALUES ('$playerusername','$playerpassword');";
  echo "1";
  
}


if ($conn->query($sql) !== FALSE) {
  } 
else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }

  if($exists==0)
  {
      session_start();
      $_SESSION['loggedin'] = true;
      $_SESSION['username'] = $playerusername;
  
  }

$conn->close();


?>