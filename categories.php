<?php
/**
 * Created by PhpStorm.
 * User: Kevynashinski
 * Date: 7/2/2016
 * Time: 12:45 AM
 */
include 'Database.php';
include 'constants.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $supermarket_id = $_REQUEST[SUPERMARKET_ID];
    $parent = array();

    $conn = Database::connect();

//$supermarket_id="a50704affeb125005587388d4f214d69c6959ae7";

    $sql = "select * from categories WHERE supermarket_id='$supermarket_id'";

    foreach ($conn->query($sql) as $row) {

        $result = array();
        $result[CATEGORY_ID] = $row[CATEGORY_ID];
        $result[CATEGORY_NAME] = $row[CATEGORY_NAME];
        $result[CATEGORY_DESCRIPTION] = $row[CATEGORY_DESCRIPTION];
        $result[CATEGORY_ICON] = $row[CATEGORY_ICON];

        array_push($parent, $result); //push the values in the array
    }
    echo json_encode(array(RESULTS => $parent));

    Database::disconnect();
} else {
//    nothing posted
    echo 3;
}
