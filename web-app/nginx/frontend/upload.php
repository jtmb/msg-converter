<?php
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
$ipaddress = getenv("REMOTE_ADDR") ;
$seconds = 15;

// Check if file already exists
if (file_exists($target_file)) {
  echo "Sorry, file already exists.";
  header("Location: ./error/file_already_exists.html");
  $uploadOk = 0;
}

// Check file size
if ($_FILES["fileToUpload"]["size"] > 5000000) {
  echo "Sorry, your file is too large.";
  header("Location: ./error/file_too_big.html");
  $uploadOk = 0;
}

// Allow certain file formats
if($FileType != "msg") {
  echo "Sorry, only .msg files are allowed.";
  header("Location: ./error/wrong_file_type.html");
  $uploadOk = 0;
}

// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
  echo " Your file was not uploaded.";
// if everything is ok, try to upload file
} else {
  if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {

    // echo "The file ". htmlspecialchars( basename( $_FILES["fileToUpload"]["name"])). " has been uploaded.";
    $output = shell_exec('python3 -m extract_msg /var/www/html/'.escapeshellarg($target_file).' --out ./converted-messages/uploads/ --prepared-html --use-filename --html ');
    $name = trim($target_file,".msg!"); //trim output
    echo file_get_contents( "/var/www/html/converted-messages/$name/message.html" ); // get the contents, and echo it out.

    // cleanup files (nothing stored)
    shell_exec('rm -rfv /var/www/html/converted-messages/'.escapeshellarg($name).'/ ');
    shell_exec('rm -rfv /var/www/html/'.escapeshellarg($target_file).'/ ');

    // make logs of files converted
    shell_exec('currentDate=`date` && echo "'.escapeshellarg($target_file).' | '.escapeshellarg($ipaddress).' | $currentDate" >> logs/logs.out');

  } else {
    echo "Sorry, there was an error uploading your file.";
  }
}
?>