<?php

$servername = "localhost";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


if(isset($_POST['settings'])){
    $jsonarray = $_POST['settings'];

    $decoded = json_decode($jsonarray, true);

    $name = $decoded['name'];
    $location = $decoded['location'];
    $open = $decoded['otime'];
    $close = $decoded['ctime'];
    $days = $decoded['day'];

    $serialized = serialize($days);

    $sql = "UPDATE rest_settings SET name='$name', location='$location', open_time='$open', close_time='$close', days='$serialized' WHERE id = 1;";
    echo "updated!";
}
else{
    $sql = "SELECT name,location,open_time,close_time,days FROM rest_settings where id=1";
    $results = $conn->query($sql);
    $exists = $results->num_rows;
    $rows = $results->fetch_assoc();
    $test = new stdClass();
    $test->name = $rows["name"];
    $test->location = $rows["location"];
    $test->open_time = $rows["open_time"];
    $test->close_time = $rows["close_time"];
    $test->days = unserialize($rows["days"]);

    echo json_encode($test);
}


if ($conn->query($sql) !== FALSE) {} 
else {
echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();


?>