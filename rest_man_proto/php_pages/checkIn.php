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
  // INSERT INTO `employee_time`(`name`, `status`, `time_loggedIn`, `time_loggedOut`, `total_hours_worked`) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]')
}
else //status=out
{
  $sql ="SELECT `name`, `status`, `time_loggedIn`, `time_loggedOut`, `total_hours_worked` FROM `employee_time` WHERE name='$name' AND status='in' ORDER BY
  3 DESC LIMIT 1;";
  // $sql = "INSERT INTO `employee_time`(`name`, `status`, `time_loggedIn`, `total_hours_worked`) VALUES ('$name','$status', CURRENT_TIMESTAMP, NULL);";
  // echo $sql;
  $results = $conn->query($sql);

  $rows = array();

while($r = mysqli_fetch_assoc($results)) {
    $rows[] = $r;
}
echo json_encode($rows);


  // $a= mysqli_fetch_assoc($results);
  // echo $a;
}

//  $sql = "INSERT INTO `employee_time`(`name`, `status`) VALUES ('$name','$status');";

 



?>