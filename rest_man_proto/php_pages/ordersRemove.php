<?php

//ensure valid user is logged in
session_start();

$privilegeLevel = isset($_SESSION['loggedin'])?$_SESSION['level']:-1;

if($privilegeLevel==-1) {
    echo 'No user logged-in';
    return;
}



?>