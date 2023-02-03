<?php
// echo file_get_contents( "/var/www/html/msg-template.php" ); // get the contents, and echo it out.
$target_dir = "../uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$FileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
$ipaddress = getenv("REMOTE_ADDR") ;
$seconds = 15;

// Check if file already exists or is empty
if (file_exists($target_file)) {
  echo file_get_contents( "/var/www/html/classic/error/file_already_exists.html" );
  $uploadOk = 0;
}

// Check file size
if ($_FILES["fileToUpload"]["size"] > 5000000) {
  echo file_get_contents( "/var/www/html/classic/error/file_too_big.html" );
  $uploadOk = 0;
}

// Allow certain file formats
if($FileType != "msg" && $FileType != "") {
  echo file_get_contents( "/var/www/html/classic/error/wrong_file_type.html" );
  $uploadOk = 0;
}

// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
// if everything is ok, try to upload file
} else {
  if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {

    // echo "The file ". htmlspecialchars( basename( $_FILES["fileToUpload"]["name"])). " has been uploaded.";
    $output = shell_exec('python3 -m extract_msg /var/www/html'.escapeshellarg($target_file).' --out /var/www/html/converted-messages/uploads/ --prepared-html --use-filename --html ');
    $name = trim($target_file,".msg!"); //trim output
    $output2 = file_get_contents( "/var/www/html/converted-messages$name/message.html" ); // get the contents, and echo it out.
    if (str_contains($output2, 'Warning: file_get_contents')) {
      echo "The string 'warning' was found in the string\n";
    } else {
      echo file_get_contents( "/var/www/html/converted-messages$name/message.html" ); // get the contents, and echo it out.
    }

    // cleanup files (nothing stored)
    shell_exec('rm -rfv /var/www/html/converted-messages/'.escapeshellarg($name).'/ ');
    shell_exec('rm -rfv /var/www/html/'.escapeshellarg($target_file).'/ ');

    // make logs of files converted
    shell_exec('currentDate=`date` && echo "'.escapeshellarg($target_file).' | '.escapeshellarg($ipaddress).' | $currentDate" >> logs/logs.out');

  } else {
  }
}
?>