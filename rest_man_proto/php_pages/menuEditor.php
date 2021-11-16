<?php

require 'mysqlConnection.php';



$categoryUpdate = isset($_POST['categoryUpdate'])?$_POST['categoryUpdate']:false;
$subcategoryUpdate = isset($_POST['subcategoryUpdate'])?$_POST['subcategoryUpdate']:false;

//determine which menu update is requested: main category, or subcategory with items
if($categoryUpdate){
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
}
else if($subcategoryUpdate){
    //build prepare statement
    
}
else{
    //nothing sent to server
}


$conn->close();
