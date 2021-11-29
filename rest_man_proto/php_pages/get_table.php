<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

$table_id = $_POST['tableid'];
$just_one = $_POST['test'];

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

if($just_one == 1){
  $sql = "SELECT id,capacity,reservations FROM table_info WHERE id='$table_id'";
}
else{
  $sql = "SELECT id,capacity,reservations FROM table_info";
}


$results = $conn->query($sql);

$rows = array();

while($r = mysqli_fetch_assoc($results)) {
  $r["reservations"] = unserialize($r["reservations"]);
  $rows[] = $r;
}
echo json_encode($rows);

if ($conn->query($sql) !== FALSE) {} 
else {echo "Error: " . $sql . "<br>" . $conn->error;}
  


$conn->close();


?>