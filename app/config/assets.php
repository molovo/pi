<?php

return [
    // Clean Destination Directories
    //
    // If true, destination directories are emptied
    // prior to compiling assets
    'clean' => true,

    // Live Compiling
    //
    // If true, assets are compiled on every page load.
    // If false, then the CLI command must be run.
    'live' => true,

    'css' => false,

    'sass' => [
        'src'         => APP_ROOT.'assets/sass/*.sass',
        'dest'        => PUB_ROOT.'assets/css',
        'minify'      => true,
        'concatenate' => true,
        'output'      => 'main.min.css',
    ],

    'js' => false,

    'coffee' => [
        'src'         => APP_ROOT.'assets/coffee/*.coffee',
        'dest'        => PUB_ROOT.'assets/js',
        'minify'      => true,
        'concatenate' => true,
        'output'      => 'main.min.js',
    ],
];
