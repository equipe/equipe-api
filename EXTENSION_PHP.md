# Extension in PHP / Laravel

Starting point working with extensions and a PHP backend

## Context

An Equipe Extension can have mutiple forms. Equipe send webhooks automatic or manual triggerd, show an iframe in a modal or direct a user to a webpage.
When using webhooks the data is send in the body of the POST request. When working with iframe or direct link the information is decoded in a JWT token and can be read through decoding it with a preset secret.

## Read data from Request
First we determine if we received a post or a get request

```php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  //process request body
} else if($_SERVER['REQUEST_METHOD'] === 'GET') {
  //process get parameter 'token'
}
```

If this request is a post, we try to read and decoded the body content

```php
 $decoded = json_decode(file_get_contents('php://input'));
```

If this request is a get, we need to initilaze a third party package to process the token

Make sure to require this package in your composer setup
[PHP-JWT by Fire base](https://github.com/firebase/php-jwt)

```php
//require composer autoload
require_once("/vendor/autoload.php");

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

//get secret
$key = env("EQUIPE_SECRET");

//get token
$jwt = $_GET['token'];

//decoded token, it automaticly is returned as an object. No need to use json_decode
JWT::$leeway = 60; // $leeway in seconds
$decoded = JWT::decode($jwt, new Key($key, 'HS256'));

```
## Access data
After decoding the input data, can you access the following variables. Please note that not always every URL is present in a request.
```php
# API Key
$decoded->api_key

## most information is stored under payload

#Type
$decoded->payload->target

# CSS (present when using modal or browser)
$decoded->payload->style_url

# Access context
$decoded->payload->starts_url
$decoded->payload->url
```

## Handle webhook
In this example we have the code for a webhook in an seperate PHP file.
There is a difference between automatic triggered events and manual triggered events

**Automatic** webhooks have there `event_name` set as the webhook describes

The following do currently exist:
- install
- uninstall
- results
- points
- imports
- publish
- prizes
- competition
- person
- horse
- timekeeping

```php
switch($decoded->event_name) {
  case "results":
    // process resuts webhook
    break;
  case "points":
    // process dressage points webhook
    break;
  default:
    break;
}
```

**manual** webhooks have there `event_name` as `action` and there `payload->target` set as `webhook`
```php
if($decoded->event_name == "action" && $decoded->payload->target == "webhook") {
  switch($decoded->payload->name) {
    case "handlewebhook":
        // process manual pushed button
      break;
    default:
      break;
}
```
## Displaying modal
When working with a modal you have to keep in mind that all data is shown in a iframe. The browser must receive from you allowens to store and return cookies from you.
In a plain PHP enviroment the following is required to start the script with

```php
// allow cookie to be set in iframe
ini_set('session.cookie_samesite', 'None');
session_set_cookie_params(['samesite' => 'None', 'secure' => true]);
session_start();
```

When you render the modal make sure to included the Equipe Styling
```php
if ($decoded->payload->target == "modal" || $decoded->payload->target == "browser") {
?>
<html>
  <head>
    <link rel="stylesheet" href="<?php echo $decoded->payload->style_url ?>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  </head>
<!-- dont forget to apply the class extension to the body -->
  <body class="extenion">

  </body>
</html>
<?php
}
?>
```
