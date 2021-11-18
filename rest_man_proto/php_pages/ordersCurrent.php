<?php

//this script handles all the needs of 'currentOrders.html': server view,
// kitchen view, and view order.

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
    function setItemNames($dictionary)
    {
        foreach ($this->items as $item) {
            $name = $dictionary[$item->getId()];
            $item->setName($name);
        }
    }
    public function jsonSerialize()
    {
        return ["OrderId" => $this->id, "items" => $this->items];
    }
    function getId()
    {
        return $this->id;
    }
}

class item implements JsonSerializable
{
    private $id;
    private $qty;
    private $name;
    private $completedCount;
    private $startTime;
    function __construct($id, $qty)
    {
        $this->id = $id;
        $this->qty = $qty;
    }
    function getId()
    {
        return $this->id;
    }
    function setName($name)
    {
        $this->name = $name;
    }
    public function setStartTime($sTime)
    {
        $this->startTime = $sTime;
    }
    public function setCompletedCount($cnt)
    {
        $this->completedCount = $cnt;
    }
    public function getStart()
    {
        return $this->startTime;
    }
    public function jsonSerialize()
    {
        return [
            "id" => $this->id, "qty" => $this->qty,
            "name" => $this->name,
            "completedCount" => $this->completedCount,
            "start" => $this->startTime
        ];
    }
}


//ensure the user is logged in and at least of employee privilege level
//need to implement still.  security, authorization.
session_start();



if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    //this is call to view an order's details or update kitchen item completion status.

    if (isset($_POST['itemId'])) {
        //kitchen request.

        //get pre-increment value.  see if next increment will fulfill order
        $query = 'SELECT completed, quantity FROM kitchen WHERE order_id='
            . $_POST['orderId'] . ' AND item_id=' . $_POST['itemId'] . ';';
        if ($result = $conn->query($query)) {
            $resultObj = $result->fetch_object();
            if ($resultObj->completed == $resultObj->quantity - 1) {
                //item has been finished

                //set completion time
                $query = 'UPDATE kitchen SET end="' . date("Y-m-d H:i:s") 
                        . '" WHERE order_id=' . $_POST['orderId'] 
                        . ' AND item_id=' . $_POST['itemId'] .';';

                if ($conn->query($query)) {
                    //success
                } else {
                    echo "error: " . $conn->error;
                }

                //check rest of order 
                $query = 'SELECT end FROM kitchen WHERE order_id='
                    . $_POST['orderId'] . ' AND end IS NULL;';
                
                $result = $conn->query($query);
                if ($result->num_rows){
                    //if any item's end time is null, then at least one item of the
                    // order is not ready
                    //increment completion count
                    //increment completed count by one.

                    $query = 'UPDATE kitchen SET completed='
                        . ($resultObj->completed + 1)
                        . ' WHERE order_id=' . $_POST['orderId'] 
                        . ' AND item_id=' . $_POST['itemId'] . ';';
                    echo $query;
                    if ($result = $conn->query($query)) {
                        //success
                    } else {
                        echo 'error: ' . $conn->error;
                    }
                } else {

                    // all items complete

                    //delete all order's items from kitchen table
                    $query = 'DELETE FROM kitchen WHERE order_id='
                        . $_POST['orderId'] . ';';

                    if ($conn->query($query)) {
                        //success
                        //update status on open_order_info to 'Ready';
                        $query = 'UPDATE open_order_info SET status="Ready"'
                                . ' WHERE order_id=' . $_POST['orderId'] . ';';
                        if ($conn->query($query)) {
                            //success
                        } else {
                            echo 'error: ' . $conn->error;
                        }
                    } else {
                        echo 'error: ' . $conn->error;
                    }
                }
            } else {
                //increment completed count by one.
                $query = 'UPDATE kitchen SET completed='
                    . ($resultObj->completed + 1) 
                    . ' WHERE order_id=' . $_POST['orderId'] 
                    . ' AND item_id=' . $_POST['itemId'] . ';';
                if ($result = $conn->query($query)) {
                    //success
                } else {
                    echo 'error: ' . $conn->error;
                }
            }
        }
    } else {
        // change user's session order #
        // so correct order loads automatically once sent to that page.

        $orderNumber = isset($_POST['orderNumber']) ? $_POST['orderNumber'] : false;

        //change session order number
        $_SESSION['order'] = $orderNumber;
        echo 'changed user\'s order number to ' . $_SESSION['order'];
    }
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
            $statement->close();

            foreach ($kitchenOrders as $order) {
                $order->setItemNames($dictionary);
            }


            //get start time and completed count from 'kitchen' table
            $query = 'SELECT start, completed FROM kitchen WHERE '
                . 'order_id=? AND item_id=?;';


            if ($statement = $conn->prepare($query)) {
                //success
            } else {
                echo 'error: ' . $conn->error;
            }

            $statement->bind_param("ii", $orderId, $itemId);
            $statement->bind_result($start, $completeCnt);

            foreach ($kitchenOrders as $order) {
                $orderId = $order->getId();
                $items = $order->getItems();
                foreach ($items as $item) {
                    $itemId = $item->getId();
                    $statement->execute();
                    if ($statement->fetch()) {
                        $item->setStartTime($start);
                        $item->setCompletedCount($completeCnt);
                    } else {
                        echo $statement->error;
                    }
                }
            }
            $statement->close();
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
