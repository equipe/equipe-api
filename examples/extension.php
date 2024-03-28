<?php
// allow cookie to be set in iframe
ini_set('session.cookie_samesite', 'None');
session_set_cookie_params(['samesite' => 'None', 'secure' => true]);
session_start();

#Check if Webhook
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
     // The request is using the POST method
	 $decoded = json_decode(file_get_contents('php://input'));
} else if($_SERVER['REQUEST_METHOD'] === 'GET') {
//import jwt handler
  require_once("vendor/autoload.php");
  
  use Firebase\JWT\JWT;
  use Firebase\JWT\Key;
  
  //get secret
  $key = env("EQUIPE_SECRET");
  
  $jwt = $_GET['token'];
  
  //signin user
  $_SESSION["lolbroek"] = "f4Tq6";
  
  JWT::$leeway = 60; // $leeway in seconds
  $decoded = JWT::decode($jwt, new Key($key, 'HS256'));
}

if ($decoded->payload->target == "modal" || $decoded->payload->target == "browser") {
?>
  <html>
  	<head>
  		<link rel="stylesheet" href="<?php echo $decoded->payload->style_url ?>">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	</head>

  <body class="extension">
  <?php
}
?>
	<?php
	if($decoded->event_name == "results") {
		// implement logic to handle result event
	} else if($decoded->event_name == "action" && $decoded->payload->target == "webhook") {
		switch($decoded->payload->name) {
			case "webhookName":
			  // impplement logic to handle webhook
			default:
				break;
		}
	}	else {
  	switch ($decoded->payload->name) {
  		case "modalName":
        // save Equipe API Key in session to reuse when use makes new request
  			$_SESSION['EquipeKey'] = $decoded->api_key;
  			echo "Welkom by demo extension";
  			break;
      default:
        break;
  	}
	}
if ($decoded->payload->target == "modal" || $decoded->payload->target == "browser") {
	?>
</body>

</html>
  <?php

}
  ?>
