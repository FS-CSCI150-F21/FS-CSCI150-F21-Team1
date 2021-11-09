<?php

//mySQL server authentication details
$servername = "127.0.0.1";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

//establish connection
$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

//verify connection
if ($conn->connect_error) {
    echo 'not connected to mysql server';
    exit('Could not connect');
}

$categoryUpdate = isset($_POST['categoryUpdate'])
    ?$_POST['categoryUpdate']:
    '{"id":"0","name":"Drinks","img":"","available":"true"}';
$categoryUpdateObj = json_decode($categoryUpdate);
//echo $categoryUpdate . '\n';

//build update query string
$updateQuery = 'UPDATE menuCategories SET name="' . $categoryUpdateObj->name
                . '", available=' . $categoryUpdateObj->available;
if($categoryUpdateObj->img!=""){
    $updateQuery .= ', imgURL="' . $categoryUpdateObj->img . '"';
}
$updateQuery .= ' WHERE id=' . $categoryUpdateObj->id . ';';

//debug
//echo $updateQuery;

echo $result = $conn->query($updateQuery);

$conn->close();

?>