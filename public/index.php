<?php

define('DS', DIRECTORY_SEPARATOR);
define('PUB_ROOT', __DIR__.DS);
define('BASE_ROOT', dirname(__DIR__).DS);
define('APP_ROOT', BASE_ROOT.'app'.DS);
define('APP_NAMESPACE', 'App\\');

require dirname(__DIR__).'/vendor/autoload.php';

Pug\Framework\Application::bootstrap();
