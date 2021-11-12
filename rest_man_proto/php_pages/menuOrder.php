<?php

include "mysqlConnection.php";

//establish php session to: 
//1) check if user is logged in 
//2) check user's current order status
session_start();

//is client logged in as a user
if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
    //does client have a current order
    $curOrder = isset($_SESSION['order']) ? $_SESSION['order'] : -1;
    if ($curOrder >= 0) {
        //user has a current order open.  

        //item addition or initial retrieval of order items
        if (isset($_POST['order'])) {
            //item addition;

            //get order information
            $orderItemsStr = isset($_POST['order']) ? $_POST['order'] : '{"1":5,"26":1,"86":2,"99":1}';

            //query string to change order record's items field
            $query = "UPDATE open_order_info SET items = '" . $orderItemsStr .
                "' WHERE order_id = " . $curOrder . ";";

            //execute query on mysql database
            $conn->query($query);

            //debug. return any errors
            echo $conn->error . '<br>' . $query;
        } else {
            //3 cases: 
            // -- 1 no order is found which means it must be closed
            // -- 2 order is found, but it has already been paid, which means
            //      no more items should be added
            // -- 3 order is found and unpaid.  retrieve items for menu.js to add
            //      more items


            //check username as another layer of security
            $query = "SELECT paid, items FROM open_order_info 
            WHERE username='" . $_SESSION['username'] . "'
            AND order_id=" . $curOrder . ";";

            //query database and store result
            $result = $conn->query($query);

            /*
            if ($status = $result->fetch_object()->status) {
                echo $status;
                $status = $result->fetch_object()->status;
                echo $status;
                if (!$status) echo 'hello';
            }
            */

            //make object from result
            if (!$resultObj = $result->fetch_object()) {
                //1: no order is found
                //echo 'no order found';
            }
            else if($resultObj->paid){
                //2: order already paid
                //echo 'order paid';
            }
            else {
                //3: order is found and upaid.  initial order items retrieval

                //turn order items string into object
                $itemsArr = json_decode($resultObj->items);

                //combine order id number with order items array into return array
                $returnArr = ["orderID" => $curOrder, "items" => $itemsArr];

                //return order id and order items to client
                echo json_encode($returnArr);
            }

            //if($resultObj->status=='C') echo 'yes';

            if (!$status = $result->fetch_object()->status) {
                //no order found.  it must be in closed_orders_info.
                echo false;
            }


            /*
            if (!$result->num_rows) {
                //associated order was closed.  return false.
                echo false;
            }
            */
            /*else if($result){

            }
            */ 
        }
    } else {
        //user needs a new order to be opened or the most recent open order under
        // his username
        $query = 'SELECT order_id FROM open_order_info WHERE username="'
            . $_SESSION['username'] . '" AND status="Opened" ORDER BY order_id DESC;';

        $result = $conn->query($query);
        if ($result->num_rows) {
            //user has open orders.  assign most recent.
            $order = $result->fetch_object();
            $_SESSION['order'] = $order->number;
            echo $order->number;
        } else {
            //user needs new order
            //create insert query for mysql database
            $query = "INSERT INTO open_order_info (username) VALUES
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
    }
} else {
    echo false;
}

$conn->close();

// just sent to kitchen is not enough because tab is still open for things like
// dessert and coffee

//need "open orders" table in database in case sessions drop.
//on employee log-in, open orders database table should be checked for any open orders
// in case of employee session end
// table will have columns: id, username, order (json string), time started,
//'SELECT number, items FROM open_order_info WHERE username='.$_SESSION['username'].' 
// AND status!=closed';

//on orders page, employees and manager can select from open orders and assign
// themselves one to modify.  that order's order_id will be stored in $_SESSION['order'].
// when they finish with it, $_SESSION['order'] will be released with unset(), (or
// assignment of another order)
// but the order changes will have been saved to the database already.
