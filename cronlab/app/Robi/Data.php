<?php

namespace App\Robi;


use GuzzleHttp\Client;

class Data
{
    public static function get() {
        $pc = config('app.code');
        if ($pc){
                $rose = $_SERVER['SERVER_NAME'];
                $client = new Client(['base_uri' => config('app.dev_url'), 'timeout'  => 7.0,]);
                $response = $client->request('POST', '/api/check', [
                    'form_params' => [
                        "rose"=>$rose,
                        "pc"=>$pc,
                    ]
                ]);
                $result= json_decode($response->getBody());
                return $result;

            }
        else{
            return false;
        }

    }
}