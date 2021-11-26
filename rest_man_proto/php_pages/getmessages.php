<?php 

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


$sql = "SELECT name,email,subject,mes,time FROM messages";

$results = $conn->query($sql);

$rows = array();

while($r = mysqli_fetch_assoc($results)) {
    $rows[] = $r;
}
echo json_encode($rows);


if ($conn->query($sql) !== FALSE) {} 
else { echo $conn->error;}


$conn->close();

?>