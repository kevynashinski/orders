<?php
/**
 * Created by PhpStorm.
 * User: lenik
 * Date: 6/27/2016
 * Time: 1:18 PM
 */
require_once 'Database.php';
include_once 'constants.php';

$conn = Database::connect();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $id = $_POST[ID];
//        $id="9b6944beefb7ee0f2e6f20756acfd55dd95a2933";

    $sql = "select * from supermarkets WHERE supermarket_id='$id'";

    if ($conn->query($sql)->rowCount() > 0) {
        echo 1;
    } else {
        echo 0;
    }
} else {
    echo 2;
}

Database::disconnect();
