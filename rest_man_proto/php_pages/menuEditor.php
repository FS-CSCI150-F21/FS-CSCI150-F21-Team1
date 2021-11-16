<?php

require 'mysqlConnection.php';

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