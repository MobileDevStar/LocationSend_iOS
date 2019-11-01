<?php


    $latitude = $_GET['latitude'];
    $longitude = $_GET['longitude'];
    
    $result = [];
    $result['status'] = "OK";
    $result['latitude'] = $latitude;
    $result['longitude'] = $longitude;
    
    echo json_encode($result);
?>