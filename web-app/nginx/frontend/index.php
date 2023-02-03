<!doctype html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:300,700,400' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="css/style.css"> <!-- Resource style -->
	<script src="js/modernizr.js"></script> <!-- Modernizr -->

  	
	<title>msg converter</title>

</head>
<body>
<div class="topnav">
  <a class="active" href="/">Home</a>
  <a href="https://github.com/jtmb/msg-converter">Repo</a>
  <a href="/about/about.php">About</a>
  <div class="topnav-right">
    <!-- <a href="index.php">Modern View</a> -->
    <a href="./classic/index.php">Classic View</a>
  </div>
</div>
<section class="cd-intro">
	<div class="cd-intro-content mask-2">
	<div class='spinner-displayer'></div>
		<div class="content-wrapper">
			<div>
				<h1>.msg converter</h1>
				<p>An open source .msg file converter 👨‍💻</p>
				<!-- <div class="action-wrapper"> -->
					<form action="upload.php" method="post" enctype="multipart/form-data">
					<input type="file" value="Upload" style="width:140px;" name="fileToUpload" class="cd-btn second-action" id="fileToUpload"></input><label for="fileToUpload" class="cd-btn second-action">Choose File</label>
					<input type="submit" name="submit" id="search-button" value="Upload" class="cd-btn"><label for="search-button" class="cd-btn">Upload</label></form>
						
	
					<p>
					<!-- <div class="button"><span class="button__text"></span></div> -->
					<!-- <div class='spinner-displayer'></div> -->

						  
				</div>
			</div>
		</div>
	</div>
<script src="/js/loading.js"></script>	
<script src=./js/jquery-2.1.4.js"></script>
<script src="./js/main.js"></script> <!-- Resource jQuery -->
</body>
</html>
