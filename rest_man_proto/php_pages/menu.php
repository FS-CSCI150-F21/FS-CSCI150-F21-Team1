<?php

$servername = "127.0.0.1";
$dbusername = "rest_manager";
$dbpassword = "iF2ONNbmcCTcdjrd";
$dbname = "rest_info";

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
    echo 'not connected to mysql server';
    exit('Could not connect');
}
/*
//debug
else {
    echo $servername, ' mySQL server connected with username: ', $dbusername, ' and 
        dbname: ', $dbname;
}
echo '<br>', $conn->host_info;
*/

//will be decided based on type of data needed, as described by $_GET['request']

if ($_GET['request'] == 'cats') {
    $query = "SELECT * FROM menuCategories;";

    $qry_result = $conn->query($query);

    //in case database table name is changed or empty
    $exists = $qry_result->num_rows;
    if (!$exists) {
        echo 'No categories.  Database table ' . $_GET['request'] . 'is empty, or renamed.';
    }

    $records = $qry_result->fetch_all();

    $jsonStr = json_encode($records);
    echo $jsonStr;

} else {
    //$_GET['request'] should be an integer to represent the selected category.
    //use it directly in query.
    $subcategoriesQuery = "SELECT * FROM menuSubcategories WHERE category=" . $_GET['request'];
    $qry_result = $conn->query($subcategoriesQuery);

    //array of records from menuSubcategories table where category=$_GET['request']
    /*
    $subcategoryRecs = $qry_result->fetch_object();
    echo $subcategoryRecs->name;
    $subcategoryRecs = $qry_result->fetch_object();
    echo $subcategoryRecs->name;
    */
    $subcategoryRecs = $qry_result->fetch_all(MYSQLI_BOTH);
    echo $subcategoryRecs[0]["name"];
    echo $subcategoryRecs[1][0];
    /*
    foreach($subcategoryRecs as $rec){
        echo $rec["name"];
    }
    */


    $itemsQuery = "SELECT * FROM menuItems WHERE category=".$_GET['request'].' ORDER BY subcategory ASC';



    /*debug
    $jsonStr = json_encode($subcategoryRecs);
    echo $jsonStr;
    */

    //$query;
}

$conn->close();

//debug
//$query = $query . '0';
//echo $query;


//debug stuff
/*
$drinks = $catNames[0];
echo $drinks;
foreach ($drinks as $val) {
    echo $val;
}
*/
