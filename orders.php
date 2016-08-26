<?php
/**
 * Created by PhpStorm.
 * User: sydney
 * Date: 8/25/16
 * Time: 11:02 PM
 */

include 'Database.php';
include 'constants.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $user_id_number=$_REQUEST[ID_NUMBER];
    $product_id=$_REQUEST[PRODUCT_ID];

    $conn=Database::connect();

    $sql= "insert into ordered_products (user_id_number, product_id) VALUES (?,?)";

    $stmt=$conn->prepare($sql);
    $stmt->bindParam(1, $user_id_number);
    $stmt->bindParam(2, $product_id);

    if($stmt->execute()){
        echo 0;
    }else{
        echo 1;
    }

    Database::disconnect();
}else{
    echo 3;
}
