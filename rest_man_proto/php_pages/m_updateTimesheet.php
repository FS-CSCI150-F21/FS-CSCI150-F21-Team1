<?php 

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

$name = $_POST['name'];
$date = $_POST['date'];
$status = $_POST['status'];
$newTime = $_POST['newTime'];


$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
session_start();
if($status=='in')
{
    $sql = "UPDATE `employee_time` SET `time_loggedIn`='$newTime' WHERE name='$name' AND date='$date' AND status='$status';";
    $results = $conn->query($sql);
    $sql1 = "UPDATE `employee_time` SET `time_loggedIn`='$newTime', total_hours_worked=TIMEDIFF(time_loggedOut, '$newTime') WHERE name='$name' AND date='$date' AND status='out';";
    $results = $conn->query($sql1);
}
else
{
    $sql2 = "UPDATE `employee_time` SET `time_loggedOut`='$newTime', total_hours_worked=TIMEDIFF('$newTime', time_loggedIn) WHERE name='$name' AND date='$date' AND status='$status';";
    $results = $conn->query($sql2);
}




if ($conn->query($sql) !== FALSE) {} 
else { echo $conn->error;}


$conn->close();

?>