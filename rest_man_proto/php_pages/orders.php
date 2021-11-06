<?php

//see if client is logged-in.  if not, JS redirects them to log-in page.
// If logged-in, present one of two views: customer or employee/manager.
// Customer view: only sees current order.
// Employee can see a current order as well as switch to view of all orders.




class item implements JsonSerializable
{
    private $id;
    private $qty;
    private $name;
    private $price;
    private $category;
    function __construct($id, $qty)
    {
        $this->id = $id;
        $this->qty = $qty;
        //$this->qty . '<br>';
    }
    function get_id()
    {
        return $this->id;
    }
    function loadDetails($rec)
    {
        //ensure the correct item's details are loaded
        if ($this->id == $rec['id']) {
            $this->name = $rec['name'];
            $this->price = $rec['price'];
            $this->category = $rec['category'];
        } else {
            echo 'Wrong item\'s details attempted to be loaded.';
        }
    }
    function jsonSerialize()
    {
        return [
            'id' => $this->id,
            'qty' => $this->qty,
            'name' => $this->name,
            'price' => $this->price,
            'category' => $this->category
        ];
    }
}

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

//establish php session to ascertain user's:
// 1) logged-in status
// 2) if order # exists
session_start();

//client's logged-in status
$privilegeLevel = isset($_SESSION['loggedin']) ? $_SESSION['level'] : -1;

if($privilegeLevel==-1){
    //if client isn't logged in, he should not be on this page
    echo json_encode(array("privilegeLevel"=>false));
    return;
}

//client's order #
$orderNumber = isset($_SESSION['order']) ? $_SESSION['order'] : false;

if (!$orderNumber) {
    //create new order

    //create insert query for MySQL database
    $query = "INSERT INTO order_info (username) VALUES
    ('" . $_SESSION['username'] . "');";

    //ask query of MySQL database
    $queryResult = $conn->query($query);

    //retrieve automatically-incremented value of order number upon record creation.
    $orderNumber = $conn->insert_id;

    //store order number in session
    $_SESSION['order'] = $orderNumber;
}

//query database for order stats
//create query string
$query = 'SELECT togo, status, created, items, table_num, last_modified ' .
    'FROM order_info ' .
    'WHERE number=' . $orderNumber . 
    ' AND username="' . $_SESSION['username'] . '";';

//query MySQL database
$result = $conn->query($query);

//fetch result from MySQL database and store into PHP object
$orderInfo = $result->fetch_object();

//turn orders blob string into object
$items = json_decode($orderInfo->items, true);

//check if items field is empty
if (empty($items)) {
    //replace the order object's items field string with the items object
    $orderInfo->items = $items; //null
} else {
    //get items' details

    //create item objects from database records
    //stores id, and quantity
    //next step will be to acquire each item's price, name, and category,
    // and also store in their respective objects
    $itemsArr;
    foreach ($items as $id => $qty) {
        $itemsArr[] = new item($id, $qty);
    }

    //create query string that gets all order items' details
    $itemsQuery = 'SELECT name, id, price, category FROM menuItems 
        WHERE id=' . current($itemsArr)->get_id();
    while ($item = next($itemsArr)) {
        $itemsQuery .= ' OR id=' . $item->get_id();
    }
    $itemsQuery .= ' ORDER BY id ASC;';

    //query MySQL database for items information: name, id, price, and category
    $itemsResult = $conn->query($itemsQuery);

    //store results locally on php 
    $itemsDetails = $itemsResult->fetch_all(MYSQLI_ASSOC);

    //load item details into respective objects
    for ($i = 0; $i < count($itemsArr); $i++) {
        $itemsArr[$i]->loadDetails($itemsDetails[$i]);
    }

    //add array of item objects to return object as 'items' field
    $orderInfo->items = $itemsArr;
}

//add orderID attribute/field to order object.
// this could be done automatically by MySQL if included in the 
// query string
$orderInfo->orderID = $orderNumber;

//load return array with privilege and order information
$return = array("privilegeLevel" => $privilegeLevel, "order" => $orderInfo);

//stringify and echo privilege level and order information to client
echo json_encode($return);

//close connection to MySQL
$conn->close();


//$return = array("privilegeLevel" => $privilegeLevel, "order" => $orderInfo);

    //debug
    /*
    $itemIDs = array_keys($items);
    foreach($itemIDs as $itemID){
        echo $itemID;
    }


    foreach($items as $item){
        echo $item;
    }
    */

    //create multiquery to get all order item prices
    //test new query to see if result needs to be freed
    /*
    $query2 = 'SELECT togo, status, created, items, table_num FROM order_info ' .
         'WHERE status="closed" AND username="' . $_SESSION['username'] . '";';
    
    $result2 = $conn->query($query2);
    if($result2->num_rows) echo 'yes';
    $result2Obj = $result2->fetch_object();

    echo $result2Obj->togo;
    */

    /*
    class helloWorld{
        function __construct(){
            echo 'hello world';
        }
    }
    $myHelloW = new helloWorld();
    */

    //echo current($itemsArr)->get_id();
    /*
    $testItem = new item(7,2);
    echo $testItem->get_id();
    */


    /*
    //find number of item IDs in order
    $itemIDsCount = count($items);
    //echo $itemIDsCount;
    //$firstItemsKey = array_key_first($items);
    //echo $items[1];

    $itemsKeys = array_keys($items);
    //echo $itemsKeys[0];

    $itemsQuery = 'Select name, id, price, category FROM menuItems 
        WHERE id=' . $itemsKeys[0];
    for($i=1;$i<$itemIDsCount;$i++){
        $itemsQuery .= ' OR id=' . $itemsKeys[$i];
    }
    $itemsQuery .= ' ORDER BY id ASC;';
    echo $itemsQuery;

    foreach($items as $item){

    }
*/

//echo $return['privilegeLevel'];
//echo $return['orderID'];
//echo $return->orderID;

//var_dump(isset($return->{'privilegeLevel'}));
//var_dump(key($return));
/*
$keys_arr = array_keys($_SESSION);

foreach($keys_arr as $key){
    echo $key . ': '. $_SESSION[$key] . '<br>';
}
*/
