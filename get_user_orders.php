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

    if (isset($_REQUEST[ID_NUMBER])) {

    $user_id_number=$_REQUEST[ID_NUMBER];

    $parent = array();

    $conn = Database::connect();

        $sql = "select * from user_orders WHERE user_id_number='$user_id_number'";

    foreach ($conn->query($sql) as $row) {

        $result = array();
        $result[ORDER_ID] = $row[ORDER_ID];
        $result[ORDERED_DATE] = $row[ORDERED_DATE];
        $result[QUANTITY] = $row[QUANTITY];

        array_push($parent, $result); //push the values in the array
    }
    echo json_encode(array(RESULTS => $parent));

    Database::disconnect();

    } else {
        echo 3;
    }
}else{
    echo 'Nothing posted';
}
