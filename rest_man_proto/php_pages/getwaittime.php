<?php 

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


$sql = "SELECT * FROM `people_count` ORDER BY `people_count`.`date_time` DESC";

$results = $conn->query($sql);

echo json_encode(mysqli_fetch_assoc($results));


?>