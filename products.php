<?php
/**
 * Created by PhpStorm.
 * User: sydney
 * Date: 8/15/2016
 * Time: 12:30 AM
 */
include 'Database.php';
include 'constants.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $category_id = $_REQUEST[CATEGORY_ID];
    $parent = array();

    $conn = Database::connect();

    $sql = "select * from products WHERE category_id='$category_id'";

    foreach ($conn->query($sql) as $row) {

        $result = array();
        $result[PRODUCT_ID] = $row[PRODUCT_ID];
        $result[PRODUCT_NAME] = $row[PRODUCT_NAME];
        $result[PRODUCT_PRICE] = $row[PRODUCT_PRICE];

        array_push($parent, $result); //push the values in the array
    }
    echo json_encode(array(RESULTS => $parent));

    Database::disconnect();
} else {
//    nothing posted
    echo 3;
}
