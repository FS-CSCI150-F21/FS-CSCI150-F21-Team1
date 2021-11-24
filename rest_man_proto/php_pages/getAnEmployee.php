<?php 

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

$username = $_POST['username'];


$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


$sql = "SELECT * FROM user_info WHERE username = '$username'";

$results = $conn->query($sql);

echo json_encode(mysqli_fetch_assoc($results));


if ($conn->query($sql) !== FALSE) {} 
else { echo $conn->error;}


$conn->close();

?>