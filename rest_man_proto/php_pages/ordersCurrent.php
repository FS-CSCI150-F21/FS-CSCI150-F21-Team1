<?php

require 'mysqlConnection.php';

class order implements JsonSerializable
{
    private $id;
    private $items = array();
    function __construct($kitchenOrderObj)
    {
        $this->id = $kitchenOrderObj->order_id;

        $itemsArr = json_decode($kitchenOrderObj->items);
        foreach ($itemsArr as $id => $qty) {
            array_push($this->items, new item($id, $qty));
        }
    }
    function echoId()
    {
        echo $this->id;
    }
    function getItems()
    {
        return $this->items;
    }
    function setItemNames($dictionary){
        foreach($this->items as $item){
            $name = $dictionary[$item->getId()];
            $item->setName($name);
        }
    }
    public function jsonSerialize(){
        return ["OrderId"=>$this->id, "items"=>$this->items];
    }
}

class item implements JsonSerializable
{
    private $id;
    private $qty;
    private $name;
    function __construct($id, $qty)
    {
        $this->id = $id;
        $this->qty = $qty;
    }
    function getId()
    {
        return $this->id;
    }
    function setName($name){
        $this->name = $name;
    }
    public function jsonSerialize(){
        return ["id"=>$this->id, "qty"=>$this->qty, "name"=>$this->name];
    }
}


//ensure the user is logged in and at least of employee privilege level
session_start();



if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    //this is call to view an order's details.  change user's session order #
    // so correct order loads automatically once sent to that page.

    $orderNumber = isset($_POST['orderNumber']) ? $_POST['orderNumber'] : false;

    //change session order number
    $_SESSION['order'] = $orderNumber;
    echo 'changed user\'s order number to ' . $_SESSION['order'];
} else if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    //client needs records to present one of the views.

    //determine which view: server or kitchen
    if ($_GET['view'] == 'server') {
        //just get and echo open orders

        //build query
        $query = 'SELECT * FROM open_order_info;';

        $result = $conn->query($query);

        if ($result->num_rows) {
            //success
            $resultArr = $result->fetch_all(true);
            echo json_encode($resultArr);
        } else {
            echo 'error: ' . $conn->error;
        }
    } else if ($_GET['view'] == 'kitchen') {
        //get open orders with status of 'kitchen' and their associated items' names,
        // quantity, and time since sent to kitchen

        //build first query
        $query = 'SELECT order_id, items FROM open_order_info WHERE status="Kitchen";';

        //echo $query;
        if ($result = $conn->query($query)) {
            //success.  get item names

            $kitchenOrders = array();
            //$test = $result->fetch_obj();
            while ($kitchenOrderObj = $result->fetch_object()) {
                $kitchenOrders[] = new order($kitchenOrderObj);
            }
            //echo count($kitchenOrders) . '<br>';
            $allItemIds = array();
            foreach ($kitchenOrders as $order) {
                $allItemIds = addUniqueItems($order->getItems(), $allItemIds);
            }

            //build second query: prepare statement
            $query = 'SELECT name FROM menuItems WHERE id=?;';
            $statement = $conn->prepare($query);
            $statement->bind_param("i", $itemId);
            $statement->bind_result($name);


            $dictionary = array();
            foreach ($allItemIds as $itemId) {
                //echo $itemId;
                //$id = $itemId;
                if ($statement->execute()) {
                    //success

                    //echo 'item id: ' . $itemId . ' acquired. <br>';
                    $statement->fetch();
                    //echo 'variable: ' . $variable . '<br>';
                    //echo '$id: ' . $id . '<br>';
                    //echo '$name: ' . $name . '<br>';
                    $dictionary[$itemId] = $name;
                } else {
                    echo 'error: ' . $statement->error . '<br>';
                }
            }

            /*
            foreach($dictionary as $key=>$val){
                echo 'key: ' . $key . '; val: ' . $val . '<br>';
            }
            */

            foreach($kitchenOrders as $order){
                $order->setItemNames($dictionary);
            }

            echo json_encode($kitchenOrders);
        } else {
            echo 'error: ' . $conn->error;
        }
    }
    $conn->close();
}

function addUniqueItems($newItems, $accumulatedList)
{
    foreach ($newItems as $item) {
        if (!in_array($item->getId(), $accumulatedList)) {
            array_push($accumulatedList, $item->getId());
        }
    }
    return $accumulatedList;
}
