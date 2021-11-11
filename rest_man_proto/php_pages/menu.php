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

//helps group items with their appropriate parent subcategory for JSON
class subcategory implements JsonSerializable
{
    private $name;
    private $id;
    private $items = array();
    function __construct($recObj)
    {
        $this->name = $recObj->name;
        $this->id = $recObj->id;
    }

    public function addItem($recObj)
    {
        //verify rec id has same id as this id.
        //not sure why this would ever fail, but adds security at server's expense
        if ($this->id == $recObj->subcategory) $this->items[] = $recObj;
        else return false;
        return true;
    }
    public function jsonSerialize()
    {
        return ['name' => $this->name, 'items' => $this->items];
    }
}

//type of data queried determined by $_GET['request']
if ($_GET['request'] == 'cats') {
    //first call to php fills the menu page with the main categories.

    //sql query as a string
    $query = "SELECT * FROM menuCategories;";

    //execute query on mySQL server
    $qry_result = $conn->query($query);

    //verify results are not empty in case: table, user, or database were changed
    $exists = $qry_result->num_rows;
    if (!$exists) {
        echo 'No categories.  Database table ' . $_GET['request'] 
            . 'is empty, or renamed.';
    }

    //store results in php's memory.
    //numerically indexed array, as opposed to associative array, or objects.
    $records = $qry_result->fetch_all();

    //stringify records array
    $jsonStr = json_encode($records);

    //return results to client
    echo $jsonStr;
} else {
    //any call after first to this page returns a specific subcategories items

    //$_GET['request'] should be an integer to represent the selected category.
    $subcategoriesQuery = "SELECT name, id FROM menuSubcategories 
        WHERE category=" . $_GET['request'] . ' AND available=1';

    //make subcategories query on mySQL database
    $qry_result = $conn->query($subcategoriesQuery);

    //records as objects from menuSubcategories table for client-requested subcategory
    while ($rec = $qry_result->fetch_object()) {
        $subcategoryObjs[] = new subcategory($rec);
    }


    //query to retrieve items
    $itemsQuery = "SELECT name, id, description, price, subcategory
        FROM menuItems WHERE category=" . $_GET['request'] . ' ORDER BY subcategory ASC';

    //make query and store result.
    $itemsResult = $conn->query($itemsQuery);

    //adds all items to appropriate subcategory objects through record fetches
    $i = 0;
    while ($itemsRec = $itemsResult->fetch_object()) {

        if (!$subcategoryObjs[$i]->addItem($itemsRec)) {
            $i++;
            $subcategoryObjs[$i]->addItem($itemsRec);
        }
    }

    //send results to client
    echo json_encode($subcategoryObjs);
}

$conn->close();