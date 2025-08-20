<?php

/**
 * Laravel - PHP built-in server router.
 */

$uri = urldecode(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));

// If the requested file exists in /public, let the server serve it directly.
if ($uri !== '/' && file_exists(__DIR__ . '/public' . $uri)) {
    return false;
}

// Otherwise, forward all requests to public/index.php
require_once __DIR__ . '/public/index.php';
