<?php
/*
this file is just to batch hash all the passwords of users who
were created before password hash was implemented in user creation.

Don't use again because the hashed passwords will be hashed again,
and users will lose access to their accounts as their unhashed passwords
will not be recognized (unless double hashed?).
*/

/*
require 'mysqlConnection.php';

//echo 'test';

$query = 'SELECT username, password FROM user_info;';

//echo $query;

if ($result = $conn->query($query)) {
    $resultSet = $result->fetch_all(MYSQLI_ASSOC);


    $prepareQuery = 'UPDATE user_info SET password=? WHERE username=?;';

    if ($stmt = $conn->prepare($prepareQuery)) {
        echo 'test';
        $stmt->bind_param("ss", $hashedPassword, $username);
        $stmt->bind_result($successBool);

        foreach ($resultSet as $record) {
            $username = $record['username'];
            echo $username . '<br>';
            $hashedPassword = hash("sha256", $record['password']);
            echo $record['password'] . ' => ' . $hashedPassword . '<br>';
            if ($stmt->execute()) {
                $stmt->fetch();
                echo 'success: ' . $successBool . '<br>';
            }
            else if($stmt->error){
                echo $stmt->error . '<br>';
            }
        }
    }
}

$conn->close();
*/