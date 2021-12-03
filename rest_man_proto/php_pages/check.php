<?php
session_start();
if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
    $test = new stdClass();
    $test->username = $_SESSION['username'];
    $test->email = $_SESSION['email'];
    $test->name = $_SESSION['first_name'];
    echo json_encode($test);
} else {
    echo 0;
}
?>