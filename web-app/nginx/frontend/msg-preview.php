<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- <button class="btn"> <formaction href='index.html'><i class="fa fa-home"></i> Home</button> -->
<button class="fa fa-home" value="Home" onclick="document.location='index.html'"></button>
<!-- <i class="fa fa-home"><input type="button"  onclick="window.location.href='https://www.w3docs.com';" value="w3docs" /> -->

<p>MSG Prewview:</p>
<hr>
<?php
    echo file_get_contents( "/var/www/html/converted-messages/$name/message.html" ); // get the contents, and echo it out.
?>