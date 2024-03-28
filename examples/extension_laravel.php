<?php

namespace App\Http\Controllers;

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

use Illuminate\Http\Request;

class equipeExtensionController extends Controller
{

    private handleWebhook($equipeData) {
      //logic here
    }

    private function handleResults($equipedata) {
      //logic to handle updated results
    }
    
    private function isJson($string)
    {
        json_decode($string);
        return json_last_error() === JSON_ERROR_NONE;
    }

    private function decodeToken($token)
    {
        $key = env('EQUIPE_SECRET');

        JWT::$leeway = 60; // $leeway in seconds
        $message = JWT::decode($token, new Key($key, 'HS256'));
        return $message;
    }

    
    function handleEquipeRequest(Request $request)
    {
        //determine if request has token, if yes decoded it, if no read body
        if ($request->exists('token')) {
            $equipeData = $this->decodeToken($request->input('token'));
        } else if ($this->isJson($request->getContent())) {
            $equipeData = json_decode($request->getContent());
        } else {
            abort(400);
        }

        // handle custom trigers Modals, Browsers & Webhooks
        if (isset($equipeData->payload->name)) {
            switch ($equipeData->payload->name) {
                case "webhook":
                    $this->hanldeWebhook($equipeData);
                    break;
                case "modal":
                    $split = explode("/", $equipeData->payload->url);
                    $showid = $split[4];
                    return view('modal.index', ['equipedata' => $equipeData, 'showid' => $showid]);
                default:
                    abort(400);
            }
        } else if ($equipeData->event_name == "results") {
            #handle webhooks
            $this->handleResults($equipeData);
        } else {
            abort(400);
        }
    }
}
