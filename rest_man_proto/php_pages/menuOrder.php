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

//establish php session to: 
//1) check if user is logged in 
//2) check user's current order status
session_start();

//is client logged in as a user
if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
    //does client have a current order
    $curOrder = isset($_SESSION['order']) ? $_SESSION['order'] : 0;
    if ($curOrder) {
        //user has a current order open.  

        //item addition or initial retrieval of order items
        if (isset($_POST['order'])) {
            //item addition;

            //get order information
            $orderItemsStr = isset($_POST['order']) ? $_POST['order'] : '{"1":5,"26":1,"86":2,"99":1}';

            //query string to change order record's items field
            $query = "UPDATE order_info SET items = '" . $orderItemsStr . 
                "' WHERE number = " . $curOrder . ";";

            //execute query on mysql database
            $conn->query($query);

            //debug. return any errors
            //echo $conn->error . '<br>' . $query;
        } else {
            //initial order items retrieval
            //check username as another layer of security
            $query = "SELECT items FROM order_info 
            WHERE username='" . $_SESSION['username'] . "'
            AND number=" . $curOrder . ";";

            //query database and store result
            $result = $conn->query($query);

            //get order items field
            $items = $result->fetch_object()->items;
            //turn order items string into object
            $itemsArr = json_decode($items);

            //combine order id number with order items array into return array
            $returnArr = ["orderID" => $curOrder, "items" => $itemsArr];

            //return order id and order items to client
            echo json_encode($returnArr);

        }
    } else {
        //user needs a new order to be opened.

        //create insert query for mysql database
        $query = "INSERT INTO order_info (username) VALUES
         ('" . $_SESSION['username'] . "');";

        //ask query of mysql database
        $queryResult = $conn->query($query);

        //retrieve automatically-incremented value of order number upon record creation.
        $orderNumber = $conn->insert_id;

        //store order number in session
        $_SESSION['order'] = $orderNumber;

        //let client know which new order was created
        echo $orderNumber;
    }
} else {
    echo false;
}

$conn->close();


            /*
            if ($result->num_rows) {
                $items = $result->fetch_object()->items;
                //echo gettype($items) . ': ' . $items . '<br>';

                //echo json_decode($items) . '<br>';
                $itemsArr = json_decode($items);
                
            $itemsDecode = json_decode($items, true);
            echo $itemsDecode;
            

                //$myArray = array(1=>4,26=>1,86=>2,99=>1);
                //echo $myArray . '<br>';
                //echo json_encode($myArray) . '<br>';

                $returnArr = ["orderID" => $curOrder, "items" => $itemsArr];
                //echo json_encode($returnArr);
            } else {
                // 'No order found.'; return empty associative array as items
                $emptyAssArr = json_decode("{}");
                //$returnArr = ["orderID" => $curOrder, "items" => $emptyAssArr ];
                $returnArr = ["orderID" => $curOrder, "items" => $itemsArr];

            }
            */


//for order page: once order is closed out through payment, unset($_SESSION['order']);
// just sent to kitchen is not enough because tab is still open for things like
// dessert and coffee

//need "open orders" table in database in case sessions drop.
//on employee log-in, open orders database table should be checked for any open orders
// in case of employee session end
// table will have columns: id, username, order (json string), time started,
//'SELECT number, items FROM order_info WHERE username='.$_SESSION['username'].' 
// AND status!=closed';

//on orders page, employees and manager can select from open orders and assign
// themselves one to modify.  that order's number will be stored in $_SESSION['order'].
// when they finish with it, $_SESSION['order'] will be released with unset(),
// but the order changes will have been saved to the database already.

//session experiment
/*
$_SESSION['test']='cat';
$sessionAnimal = isset($_SESSION['test'])?$_SESSION['test']:'dog';
echo $sessionAnimal;
*/
//$orderStr = isset($_POST['order'])?$_POST['order']:'{"items":["s6":{"name":"Magnificent Manhattan","price":"15.00","quantity":1}],"user":"angryduck462","displayTblRef":"test"}';


//$orderStr2 = '{"items":[null,{"name":"From Mexico with Love","price":"13.00","quantity":1}],"user":"angryduck462","displayTblRef":{}}';




/*
echo $orderStr3 . '<br>';

$orderArr3 = json_decode($orderStr3,true);//true sets to associate array

$arrKeys = array_keys($orderArr3['items']);

echo $arrKeys . '<br>';

foreach($arrKeys as $key){
    echo 'id: ' .$key . '; quantity: ' . $orderArr3['items'][$key]['quantity'] . '<br>';
}

echo '<br>';

foreach($orderArr3['items'] as $item){
    echo $item['name'] . ' has id: ' . $item;
}
*/

//class

/*
//$orderObj = json_decode($_POST['order']);
$orderObj = json_decode($orderStr,true);

//echo $orderObj->user;
echo $orderObj['user'];

echo $orderObj['items'];

foreach($orderObj['items'] as $item){
    echo($item['name']);
}


*/
//echo $orderObj->displayTblRef;
//echo $orderObj->items->s6;

/*
foreach($orderObj as $val){
    echo $val;
}
*/
//$itemsObj = $orderObj->items;


//echo $itemsObj->s6;
//echo $order->user;

//echo $order->items;
