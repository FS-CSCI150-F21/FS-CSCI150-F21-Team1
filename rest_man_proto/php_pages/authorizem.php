<?php
session_start();

if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true && $_SESSION['level'] == 0) {
    echo $_SESSION['username'];
} else {
    echo NULL;
}
?>