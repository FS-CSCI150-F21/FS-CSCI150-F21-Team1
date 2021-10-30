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


class subcategory implements JsonSerializable
{
    public $name; //change these all to private once json_serialization implemented
    public $id;
    public $items = array();
    function __construct($recObj)
    {
        $this->name = $recObj->name;
        //echo 'Created subcategory object: ';
        //echo $recObj->name . '<br>';
        $this->id = $recObj->id;
        //echo 'name: ' . $this->name;
        /*
        foreach($this->items as $ele){
            echo $ele;
        }
        */
    }
    public function addItem($recObj)
    {
        //echo 'addItem Function <br>';
        //verify rec id has same id as this id.
        //only reason this would fail is if mysql was wrong
        if ($this->id == $recObj->subcategory) $this->items[] = $recObj;
        else return false;
        return true;
    }
    public function jsonSerialize()
    {
        return ['name' => $this->name, 'items'=>$this->items];
    }
}

/*
//debug
else {
    echo $servername, ' mySQL server connected with username: ', $dbusername, ' and 
        dbname: ', $dbname;
}
echo '<br>', $conn->host_info;
*/

//type of data queried determined by $_GET['request']
if ($_GET['request'] == 'cats') {
    //first call to php fills the menu page with the main categories.
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
    //any call after first to this page returns a specific subcategories items

    //$_GET['request'] should be an integer to represent the selected category.
    $subcategoriesQuery = "SELECT name, id FROM menuSubcategories 
        WHERE category=" . $_GET['request'] . ' AND available=1';

    //make query on mySQL database
    $qry_result = $conn->query($subcategoriesQuery);

    //array of records from menuSubcategories table where category=$_GET['request']

    /*
    $subcatsArr = array();
    while ($subcategoryRec = $qry_result->fetch_object()) {
        //echo $subcategoryRecs->name;
        /*
        if ($subcategoryRecs->available) {
            $subcatsArr[] = new subcategory($subcategoryRecs);
        }
        */
    /*
        $subcatsArr[] = new subcategory($subcategoryRec);
    }
    */
    while ($rec = $qry_result->fetch_object()) {
        $subcategoryObjs[] = new subcategory($rec);
    }
    //echo json_encode($rec);
    //echo json_encode($subObj);
    /*
    echo $subcategoryRecs->name;
    $subcategoryRecs = $qry_result->fetch_object();
    echo $subcategoryRecs->name;
    */

    //echo $subcatsArr[4]->name;


    /*
    $subcategoryRecs = $qry_result->fetch_all(MYSQLI_BOTH);
    echo $subcategoryRecs[0]["name"];
    //echo $subcategoryRecs[0]["name"];
    //echo $subcategoryRecs[1][0];
    //$test = new subcategory($subcategoryRecs[0]);
    $subcatArr = array();

    //$subcatArr[]='test';
    //echo $subcatArr;
    $rec1 = new subcategory($subcategoryRecs[0]);
    $subcatArr[] = $rec1;
    echo $rec1->name;
    $subcatArr[] = new subcategory($subcategoryRecs[0]);
    echo $subcatArr[0]->name;
    echo $subcatArr[0];
    echo $subcatArr[1];
    */
    /*
    foreach($subcategoryRecs as $rec){
        if($rec["available"]) echo 'yes';
        $subcatArr[] = new subcategory($rec);
    }
    foreach($subcatArr as $ele){
        echo $ele->name;
    }
    $myTest = $subcatArr[0];
    echo $myTest->name;
    echo $subcatArr[0]["name"];
*/

    /*
    foreach($subcategoryRecs as $rec){
        echo $rec["name"];
    }
    */




    //query to retrieve items
    $itemsQuery = "SELECT name, id, description, price, subcategory
        FROM menuItems WHERE category=" . $_GET['request'] . ' ORDER BY subcategory ASC';

    $itemsResult = $conn->query($itemsQuery);
    $itemsRec = $itemsResult->fetch_object();
    //echo $itemsRec->name;

    $i = 0;
    while($itemsRec = $itemsResult->fetch_object()) {
        if(!$subcategoryObjs[$i]->addItem($itemsRec)) {
            $i++;
            $subcategoryObjs[$i]->addItem($itemsRec);
        }
    }
    echo json_encode($subcategoryObjs);
    /*debug
    $jsonStr = json_encode($subcategoryRecs);
    echo $jsonStr;
    */

    //$query;

    /*
    $dog = 'dog';
    $cat = 'cat';
    $animal = 'animal';

    echo json_encode($animal,$dog);
    */
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
