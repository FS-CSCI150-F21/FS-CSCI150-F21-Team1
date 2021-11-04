<?php

session_start();
if(session())

$orderStr = isset($_POST['order'])?$_POST['order']:'{"items":["s6":{"name":"Magnificent Manhattan","price":"15.00","quantity":1}],"user":"angryduck462","displayTblRef":"test"}';


//$orderStr2 = '{"items":[null,{"name":"From Mexico with Love","price":"13.00","quantity":1}],"user":"angryduck462","displayTblRef":{}}';

$orderStr3 = '{"items":{"0":{"name":"Smashing Pumpkin","price":"10.00","quantity":2},"1":{"name":"From Mexico with Love","price":"13.00","quantity":1}},"user":"angryduck462","displayTblRef":{}}';

//echo $orderStr;

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

class 

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

?>