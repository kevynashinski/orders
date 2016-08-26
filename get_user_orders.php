<?php
/**
 * Created by PhpStorm.
 * User: sydney
 * Date: 8/26/16
 * Time: 11:29 AM
 */
include 'Database.php';
include 'constants.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $user_id_number=$_REQUEST[ID_NUMBER];

    $parent = array();

    $conn = Database::connect();

    $sql = "select * from ordered_products WHERE user_id_number='$user_id_number'";

    foreach ($conn->query($sql) as $row) {

        $result = array();
        $result[PRODUCT_ID] = $row[PRODUCT_ID];
        $result[CREATED_AT] = $row[CREATED_AT];

        array_push($parent, $result); //push the values in the array
    }
    echo json_encode(array(RESULTS => $parent));

    Database::disconnect();
}else{
    echo 3;
}
