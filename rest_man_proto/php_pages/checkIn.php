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
$name= $_SESSION['first_name'];

if($status == 'in')
{
  $sql = "INSERT INTO `employee_time`(`name`, `status`, `time_loggedIn`, `total_hours_worked`) VALUES ('$name','$status', CURRENT_TIME, NULL);";
  echo $sql;
  $results = $conn->query($sql);
}
else //status=out
{
  $sql ="SELECT `name`, `status`, `time_loggedIn`, `time_loggedOut`, `total_hours_worked` FROM `employee_time` WHERE name='$name' AND status='in' ORDER BY
  3 DESC LIMIT 1;";
  echo $sql;

  $results = $conn->query($sql);

  $exists = $results->num_rows;

  $rows = $results->fetch_assoc();

  $loginTime = $rows['time_loggedIn'];
  echo $loginTime;
  $sql1 = "INSERT INTO `employee_time`(`name`, `status`, `time_loggedIn`, `time_loggedOut`, `total_hours_worked`) VALUES ('$name','$status','$loginTime', CURRENT_TIME, TIMEDIFF(CURRENT_TIME, '$loginTime'));";
  echo $sql1;
  $result = $conn->query($sql1);


}



?>