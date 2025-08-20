<?php

use App\Enums\StatusEnum;

return [

    'app_name'    => "CartUser",
    'software_id' => "7VTTOBPHDUSB6J54",
    'version'     => 2.6,

    'cacheFile'   => 'Q2FydHVzZXI=',

    'core' => [
        'appVersion' => '2.6',
        'minPhpVersion' => '8.2'
    ],

    'requirements' => [

        'php' => [
            'Core',
            'bcmath',
            'openssl',
            'pdo_mysql',
            'mbstring',
            'tokenizer',
            'json',
            'curl',
            'gd',
            'zip',
            'mbstring',


        ],
        'apache' => [
            'mod_rewrite',
        ],

    ],
    'permissions' => [
        '.env'     => '666',
        'storage'     => '775',
        'bootstrap/cache/'       => '775',
    ],

];
