<?php
/**
 * Created by PhpStorm.
 * User: lenik
 * Date: 6/13/2016
 * Time: 1:07 PM
 */

require_once 'Database.php';

if (Database::connect())
    echo 'Ready to Roll!!!';
