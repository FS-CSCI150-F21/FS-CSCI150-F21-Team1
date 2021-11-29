<?php
session_start();

if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true && ($_SESSION['level'] < 2)) {
    echo $_SESSION['level'];
} else {
    echo NULL;
}
?>