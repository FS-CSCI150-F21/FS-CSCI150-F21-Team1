<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

$tableid = $_POST['id'];

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// $sql = "SELECT id,capacity,reservations FROM table_info WHERE id='$tableid'";
// $results = $conn->query($sql);
// $exists = $results->num_rows;
// $rows = $results->fetch_assoc();
// $test = new stdClass();
// $test->id = $rows["id"];
// $test->capacity = $rows["capacity"];
// $test->reservations = unserialize($rows["reservations"]);
// while($r = mysqli_fetch_assoc($results)) {
//   $r["reservations"] = unserialize($r["reservations"]);
//   $rows[] = $r;
// }
// echo json_encode($rows);

$sql = "SELECT id,capacity,reservations FROM table_info";

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