<?php

require 'mysqlConnection.php';

session_start();

//check client is logged in as a user and that user has sufficient privileges
$username = isset($_SESSION['username'])?$_SESSION['username']:false;

if($username){
    //check privilege level
    $query = "SELECT level FROM user_info WHERE username='" . $username . "';";
    if($result = $conn->query($query)){
        $privLvl = $result->fetch_object()->level;
        if($privLvl!=0){
            return;
        }
    }
    else{
        return;
    }
}
else{
    return;
}



$categoryUpdate = isset($_POST['categoryUpdate'])?$_POST['categoryUpdate']:false;
$subcategoryUpdate = isset($_POST['subcategoryUpdate'])?$_POST['subcategoryUpdate']:'{"items":[{"id":"59","newName":"Togarashi Chips with Toasted Sesame Onion Dip","newDescr":"Flash fried Idaho potatoes, dusted with salt and chili-centric Japanese togarashi spice mix. Paired with mayo-based dip made with slow roasted Spanish onion, toasted sesame oil, crispy garlic, and Canadian steak seasoning.","newPrice":"17.00"},{"id":"60","newName":"Clarified Butter Fried Chips and Caviar","newDescr":"Yukon gold potato chips fried in clarified butter served with whipped créme frâiche deced out with chives – plus Ossetra caviar.","newPrice":"18.00"},{"id":"61","newName":"Deviled Crab Dip with Old Bay Chips","newDescr":"Crab, cream cheese, aged white cheddar, yellow cheddar, and cayenne covered in breadcrumbs. Old Bay spiced potato chips with pickled vegetables: chilies, onions, okra, cauliflower, and zucchini.","newPrice":"23.00"}],"newName":"Chips & Dips","id":"9"}';


//determine which menu update is requested: main category, or subcategory with items
if($categoryUpdate){
    $categoryUpdateObj = json_decode($categoryUpdate);

    echo $categoryUpdate;
    echo $categoryUpdateObj->available . '<br>';

    //echo $categoryUpdateObj->img;

    $available = ($categoryUpdateObj->available)?1:0;

    //build update query string
    $updateQuery = 'UPDATE menuCategories SET name="' . $categoryUpdateObj->name
                    . '", available=' . $available;
    if($categoryUpdateObj->img!=""){
        $updateQuery .= ', imgURL="' . $categoryUpdateObj->img . '"';
    }
    $updateQuery .= ' WHERE id=' . $categoryUpdateObj->id . ';';

    //debug
    echo $updateQuery;

    echo $result = $conn->query($updateQuery);


}
else if($subcategoryUpdate){
    
    //debug
    //echo $subcategoryUpdate;

    //get object from JSON string
    $subcategoryUpdateObj = json_decode($subcategoryUpdate,false);

    /*debug
    echo 'newName: ' . $subcategoryUpdateObj->newName;
    echo 'id: ' . $subcategoryUpdateObj->id;
    */
    
    //update subcategory name, first
    //build query
    $query = 'UPDATE menuSubcategories SET name="' 
            . $subcategoryUpdateObj->newName
            . '" WHERE id=' . $subcategoryUpdateObj->id . ';';

    //echo $query;

    if($conn->query($query)){
        echo 'success';
    }
    else{
        echo $conn->error;
    }


    //update subcategory's items, second
    //build prepare statement
    $query = 'UPDATE menuItems SET name=?, description=?, price=?, available=?' 
            . ' WHERE id=?;';

    //debug
    //echo $query;

    //prepare statement
    $stmt = $conn->prepare($query);

    $stmt->bind_param("ssdii",$name,$descr,$price,$avail,$id);
    echo $stmt->error;
    $items = $subcategoryUpdateObj->items;

    foreach($items as $item){
        $name = $item->newName;
        $descr = $item->newDescr;
        $price = $item->newPrice;
        $avail = $item->newAvail;
        echo $avail;
        $id = $item->id;
        $stmt->execute();
        echo '<br>' . $stmt->error;
    }

    if($conn->error){
        echo $conn->error;
    }
    else{
        echo 'success';
    }

    $stmt->close();
    

}
else{
    //nothing sent to server
}


$conn->close();
