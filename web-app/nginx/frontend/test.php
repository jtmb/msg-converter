<?php
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$FileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
$ipaddress = getenv("REMOTE_ADDR") ;
$seconds = 15;

echo file_get_contents( "./error/wrong_file_type.html" );
?>