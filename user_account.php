<?php
/**
 * Created by PhpStorm.
 * User: sydney
 * Date: 8/26/16
 * Time: 9:41 AM
 */
include_once 'constants.php';
include_once 'Database.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $idNumber=$_REQUEST[ID_NUMBER];
    $fullName=$_REQUEST[FULL_NAME];
    $phoneNumber=$_REQUEST[PHONE_NUMBER];
    $gender=$_REQUEST[GENDER];
    $location=$_REQUEST[LOCATION];

    $conn=Database::connect();

    $sql="select * from users WHERE id_number='$idNumber' LIMIT 1";

    if($conn->query($sql)->rowCount()>0){
        echo 2;
    }else{

        $sql="insert into users (id_number, full_name, gender, location, phone_number) VALUES (?,?,?,?,?)";

        $stmt=$conn->prepare($sql);
        $stmt->bindParam(1, $idNumber);
        $stmt->bindParam(2, $fullName);
        $stmt->bindParam(3, $gender);
        $stmt->bindParam(4, $location);
        $stmt->bindParam(5, $phoneNumber);

        if($stmt->execute()){
            echo 0;
        }else{
            echo 1;
        }

        Database::disconnect();
    }
}else{
    echo 3;
}
