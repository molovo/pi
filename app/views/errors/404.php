<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <title>Page Not Found</title>

    <style>
        body{background:#3c91e6;font:16px -apple-system,BlinkMacSystemFont,'Helvetica Neue',sans-serif;line-height:1.5em;margin:0;padding:0}header{left:50%;opacity:0;position:fixed;top:50%;transform:translate(-50%,-50%);transition:opacity 0.25s 0.25s}.loaded header{opacity:1}.pug{width:3em;height:3em}h1{color:white;font-size:3em;line-height:1em;margin:0 0 .5em}
    </style>
</head>
<body>
    <header>
        <!--
            Icon created by Eugen Belyakoff
            from the Noun Project
        -->
        <?php include PUB_ROOT.'assets/img/pug.svg' ?>
        <h1>Sorry, that page could not be found.</h1>
    </header>

    <script>
        (function(){window.addEventListener('DOMContentLoaded',function(){var callback;callback=function(){return document.body.classList.add('loaded');};return setTimeout(callback,125);});}).call(this);
    </script>
</body>
</html>
