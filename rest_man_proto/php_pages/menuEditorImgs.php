<?php


require 'mysqlConnection.php';

//echo $_POST['name'];

//$id = $_POST['id'];
//echo $id;

$filename = $_FILES['file']['name'];

$filesKeys = array_keys($_FILES);

foreach($_FILES as $key => $val){
    echo $key . ' and ' . $val;
}

//echo 'hello';

//echo $filename;

$location = '../images/menu/' . $filename;

//echo $location;

if(move_uploaded_file($_FILES['file']['tmp_name'],$location)){
    echo "Success";

    //change image file path name stored in database
    //build query
    $query = 'UPDATE menuCategories SET imageURL="' . $filename
        . '" WHERE id=' . $_POST['id'] . ';';

    //echo query for debug
    echo $query;

    if($conn->query($query)){
        echo "database image filename changed successfully";
    }
    else{
        echo "error: " . $conn->error;
    }

}
else{
    echo "Failure";
}

?>