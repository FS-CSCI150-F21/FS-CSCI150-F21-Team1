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

//establish php session to check user's order status
session_start();

$curOrder = isset($_SESSION['order']) ? $_SESSION['order'] : 0;
if ($curOrder) {
    //user has an order open.  

    //item addition or initial retrieval of order items
    if (isset($_POST['order'])) {
        //item addition;

        //get order information
        $orderStr = isset($_POST['order']) ? $_POST['order'] : '{"items":{"0":{"name":"Smashing Pumpkin","price":"10.00","quantity":2},"1":{"name":"From Mexico with Love","price":"13.00","quantity":1}},"user":"angryduck462","displayTblRef":{}}';

        echo $orderStr;
    } else {
        //initial order items retrieval
        //check username just as another layer of security
        $query = "SELECT items FROM order_info 
            WHERE username='" . $_SESSION['username'] . "'
            AND number=" . $curOrder . ";";

        //debug
        //echo $query;

        $result = $conn->query($query);

        if($result->num_rows){
            $items = $result->fetch_object()->items;
            //echo gettype($items) . ': ' . $items . '<br>';

            //echo json_decode($items) . '<br>';
            $itemsArr = json_decode($items);
            /*
            $itemsDecode = json_decode($items, true);
            echo $itemsDecode;
            */

            //$myArray = array(1=>4,26=>1,86=>2,99=>1);
            //echo $myArray . '<br>';
            //echo json_encode($myArray) . '<br>';

            $returnArr = ["orderID"=>$curOrder,"items"=>$itemsArr];
            echo json_encode($returnArr);
        }
        else{
            echo 'No order found.';
        }
        
    }

    /*
    echo 'set';
    echo $curOrder;
    */
} else {
    //user needs a new order to be opened.

    //for test purposes
    //$_SESSION['username']='angryduck462';

    //create insert query for mysql database
    $query = "INSERT INTO order_info (username) VALUES
         ('" . $_SESSION['username'] . "');";

    //debug to verify query
    //echo $query . '<br>';

    //ask query of mysql database
    $queryResult = $conn->query($query);

    //debug query
    //echo $conn->error . "<br>";

    //retrieve automatically-incremented value of order number upon record creation.
    $orderNumber = $conn->insert_id;

    //store order number in session
    $_SESSION['order'] = $orderNumber;

    //let client know which new order was created
    echo $orderNumber;
}


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
