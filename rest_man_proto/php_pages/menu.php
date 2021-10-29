<?php
//echo 'test';
//echo "test";
$servername = "127.0.0.1";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";
//echo 'tee';
$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);
//echo 'hey';
if ($conn->connect_error) {
    echo 'not connected to mysql server';
    exit('Could not connect');
} 
/*
else {
    echo $servername, ' mySQL server connected with username: ', $dbusername, ' and 
        dbname: ', $dbname;
}
echo '<br>', $conn->host_info;
*/

$query = "SELECT * FROM menuCategories;";

$qry_result = $conn->query($query);

//in case database table name is changed or empty
$exists = $qry_result->num_rows;
if (!$exists) {
    echo 'No categories.  Database table menuCategories is empty, or renamed.';
}

//debug stuff
//echo $qry_result->num_rows;

$categories = $qry_result->fetch_all();
//echo $categories[0][0];

//debug stuff
/*
$drinks = $catNames[0];
echo $drinks;
foreach ($drinks as $val) {
    echo $val;
}
*/

$jsonStr = json_encode($categories);
echo $jsonStr;

//echo $qry_result->available;
