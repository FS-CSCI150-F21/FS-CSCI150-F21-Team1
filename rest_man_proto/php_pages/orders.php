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

if ($privilegeLevel == -1) {
    //if client isn't logged in, he should not be on this page
    echo json_encode(array("privilegeLevel" => false));
    $conn->close();
    return;
}

//client's order #
$orderNumber = isset($_SESSION['order']) ? $_SESSION['order'] : false;

if (!$orderNumber) {
    //create new order or check for recent open orders

    $query = 'SELECT number FROM open_order_info WHERE username="'
        . $_SESSION['username'] . '" AND status="Opened" ORDER BY number DESC;';

    $result = $conn->query($query);
    if ($result->num_rows) {
        //user has open orders.  assign most recent.
        $order = $result->fetch_object();
        $_SESSION['order'] = $order->number;
        $orderNumber =  $order->number;
    } else {
        //create insert query for MySQL database
        $query = "INSERT INTO open_order_info (username) VALUES
                ('" . $_SESSION['username'] . "');";

        //ask query of MySQL database
        $queryResult = $conn->query($query);

        //retrieve automatically-incremented value of order number upon record creation.
        $orderNumber = $conn->insert_id;

        //store order number in session
        $_SESSION['order'] = $orderNumber;
    }
}

//query database for order stats
//create query string
$query = 'SELECT togo, status, created, items, table_num, last_modified, eRTime ' .
    'FROM open_order_info ' .
    'WHERE order_id=' . $orderNumber .
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
