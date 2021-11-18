<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";



$status = $_POST['s'];

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


session_start();
$name= $_SESSION['username'];

if($status == 'in')
{
  $sql = "INSERT INTO `employee_time`(`name`, `status`, `time_loggedIn`, `total_hours_worked`) VALUES ('$name','$status', CURRENT_TIMESTAMP, NULL);";
  echo $sql;
  $results = $conn->query($sql);
}
else //status=out
{
  echo "out";
  $sql ="SELECT `name`, `status`, `time_loggedIn`, `time_loggedOut`, `total_hours_worked` FROM `employee_time` WHERE name='$name' AND status='in' ORDER BY
  3 DESC LIMIT 1;";

  $results = $conn->query($sql);

  $exists = $results->num_rows;

  $rows = $results->fetch_assoc();

  $loginTime = $rows['time_loggedIn'];
  $sql1 = "INSERT INTO `employee_time`(`name`, `status`, `time_loggedIn`, `time_loggedOut`, `total_hours_worked`) VALUES ('$name','$status','$loginTime', CURRENT_TIMESTAMP, TIMESTAMPDIFF(MINUTE, '$loginTime', CURRENT_TIMESTAMP));";
  $result = $conn->query($sql1);


}



?>