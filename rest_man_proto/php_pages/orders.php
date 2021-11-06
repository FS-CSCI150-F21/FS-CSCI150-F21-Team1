<?php

//see if client is logged-in.  if not, have JS redirect them to log-in page.
// otherwise, present 1 of two views: customer and employee/manager.
// customer view can only see his current order.
// employee can see a current order as well as switch to view of all orders.


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
// 2) order # (if it even exists)
session_start();

//client's logged-in status
$privilegeLevel = isset($_SESSION['loggedin'])?$_SESSION['level']:false;

//client's order #
//if client isn't logged in, he won't have an order # either
//need to change this after testing is done so that '15' is replaced with 'false'
$order = isset($_SESSION['order'])?$_SESSION['order']:15;


//query database for order's items
if($order){
    //create query string
    $query = 'SELECT togo, status, created, items, table_num FROM order_info ' .
         'WHERE number=' . $order . ' AND username="' . $_SESSION['username'] . '";';
    
    //debug
    //echo $query;

    //query MySQL database
    $result = $conn->query($query);

    //fetch result from MySQL database and store into PHP object
    $orderInfo = $result->fetch_object();

    //turn orders blob string into object
    //echo $orderInfo->items;
    $items = json_decode($orderInfo->items, true);
    //echo $items[0];

    //add orderID attribute/field to order object.
    // this could have been done automatically by MySQL if included in the 
    // query string
    $orderInfo->orderID = $order;

    //replace the order object's items field string with the items object
    $orderInfo->items = $items;

    //$order = json_encode($orderInfo);

    //update $order variable to reflect an entire object instead of an ID 
    // like before.  this simplifies the code such that if there is no order 
    // ID (this if statement isn't executed), then the script's responseText is 
    // still in the same format.
    $order = $orderInfo;


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

    class item implements JsonSerializable{
        private $id;
        private $qty;
        private $name;
        private $price;
        private $category;
        function __construct($id,$qty){
            $this->id = $id;
            $this->qty = $qty;
            //echo 'new item created - id: ' . $this->id . '; qty: ' . 
                $this->qty . '<br>';
        }
        function get_id(){
            return $this->id;
        }
        function loadDetails($rec){
            //ensure the correct item's details are loaded
            if($this->id == $rec['id']){
                $this->name = $rec['name'];
                $this->price = $rec['price'];
                $this->category = $rec['category'];
                //echo 'worked';
            }
        }
        function jsonSerialize(){
            return [
                'id'=>$this->id,
                'qty'=>$this->qty,
                'name'=>$this->name,
                'price'=>$this->price,
                'category'=>$this->category
            ];
        }
    }
    
    $itemsArr;
    foreach($items as $id=>$qty){
        $itemsArr[] = new item($id,$qty);
    }

    //create query string that gets all order items details
    $itemsQuery = 'SELECT name, id, price, category FROM menuItems 
        WHERE id=' . current($itemsArr)->get_id();
    while($item = next($itemsArr)){
        $itemsQuery .= ' OR id=' . $item->get_id();
    }
    $itemsQuery .= ' ORDER BY id ASC;';

    //debug.  verify query works manually with copy/paste.
    //echo $itemsQuery;

    //query MySQL database for items information: name, id, price, and category
    $itemsResult = $conn->query($itemsQuery);

    //store results locally on php 
    $itemsDetails = $itemsResult->fetch_all(MYSQLI_ASSOC);

    //echo $itemsDetails[0]['name'];

    for($i = 0;$i<count($itemsArr);$i++){
        $itemsArr[$i]->loadDetails($itemsDetails[$i]);
    }


    $orderInfo->items = $itemsArr;

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


}

$return = array("privilegeLevel" => $privilegeLevel, "order" => $order);

//echo $return['privilegeLevel'];
//echo $return['orderID'];
//echo $return->orderID;

//var_dump(isset($return->{'privilegeLevel'}));
//var_dump(key($return));

echo json_encode($return);


/*
$keys_arr = array_keys($_SESSION);

foreach($keys_arr as $key){
    echo $key . ': '. $_SESSION[$key] . '<br>';
}
*/



?>