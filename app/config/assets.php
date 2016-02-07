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
        'src'         => 'sass/*.sass',
        'dest'        => 'css',
        'minify'      => true,
        'concatenate' => true,
        'output'      => 'main.min.css',
    ],

    'js' => false,

    'coffee' => [
        'src'         => 'coffee/*.coffee',
        'dest'        => 'js',
        'minify'      => true,
        'concatenate' => true,
        'output'      => 'main.min.js',
    ],
];
