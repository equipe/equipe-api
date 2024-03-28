<?php
// allow cookie to be set in iframe
ini_set('session.cookie_samesite', 'None');
session_set_cookie_params(['samesite' => 'None', 'secure' => true]);
session_start();
//import jwt handler
require_once("/running/jwt/vendor/autoload.php");
  
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

function getEquipeApi($url, $key, $debug)
{
	// Create a new cURL resource
	$ch = curl_init("https://app.equipe.com/meetings/".$url);

	$xkey = "x-api-key: $key";

	// Set the content type to application/json
	curl_setopt($ch, CURLOPT_HTTPHEADER, array($xkey));

	// Return response instead of outputting
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

	// Execute the POST request
	$result = curl_exec($ch);
	$response = curl_getinfo($ch);
	// Close cURL resource
	curl_close($ch);
	switch ($response['http_code']) {
		case 200:  # OK
			$data = json_decode($result);
			break;
		default:
			$data = 'Unexpected HTTP code: ' . $response['http_code'];
			break;
	}
	if ($debug) {
		var_dump($data);
	}
	return $data;
}

#Check if Webhook
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
     // The request is using the POST method
	 $decoded = json_decode(file_get_contents('php://input'));
} else if($_SERVER['REQUEST_METHOD'] === 'GET') {
  //get secret
  $key = $_ENV["EQUIPE_SECRET"];
  //get token
  $jwt = $_GET['token'];
  
  JWT::$leeway = 60; // $leeway in seconds
  $decoded = JWT::decode($jwt, new Key($key, 'HS256'));
}
//when modal or browser include basic HTML structure
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
			case "webhookname":
			  // implement logic to handle webhook
			default:
				break;
		}
	}	else {
  	switch ($decoded->payload->name) {
  		case "modalname":
			// save Equipe API Key in session to reuse when use makes new request
  			$_SESSION['EquipeKey'] = $decoded->api_key;
			$spliturl = explode("/", $decoded->payload->url);
			$showid = $spliturl[4];
			$compid = $spliturl[6];
			$showdata = getEquipeApi("$showid/settings.json", $decoded->api_key, false);
  			echo "<h2>Welkom by demo extension</h2>";
			echo "<p>Show: " . $showdata->meeting_name . "</p>";
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
