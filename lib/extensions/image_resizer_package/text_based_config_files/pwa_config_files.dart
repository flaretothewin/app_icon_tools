const String _name = 'PWA Flutter App'; //TODO Add real app name maybe?

String pwaHtml(String _color) => '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta content="IE=Edge" http-equiv="X-UA-Compatible">
  <meta name="description" content="$_name>

  <!-- iOS meta tags & icons -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
  <meta name="apple-mobile-web-app-title" content="$_name">
  <link rel="apple-touch-icon" href="icons/Icon-192.png">
  <link rel="apple-touch-icon" sizes="57x57" href="icons/Icon-57.png">
  <link rel="apple-touch-icon" sizes="60x60" href="icons/Icon-60.png">
  <link rel="apple-touch-icon" sizes="72x72" href="icons/Icon-72.png">
  <link rel="apple-touch-icon" sizes="76x76" href="icons/Icon-76.png">
  <link rel="apple-touch-icon" sizes="114x114" href="icons/Icon-114.png">
  <link rel="apple-touch-icon" sizes="120x120" href="icons/Icon-120.png">
  <link rel="apple-touch-icon" sizes="144x144" href="icons/Icon-144.png">
  <link rel="apple-touch-icon" sizes="152x152" href="icons/Icon-152.png">
  <link rel="apple-touch-icon" sizes="180x180" href="icons/Icon-180.png">
  <link rel="icon" type="image/png" sizes="192x192" href="icons/Icon-192.png">
  <link rel="icon" type="image/png" sizes="96x96" href="icons/Icon-96.png">
  <link rel="icon" type="image/png" sizes="32x32" href="icons/Icon-32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="icons/Icon-16.png">

  <!-- Favicon -->
  <link rel="icon" type="image/png" href="icons/favicon.png"/>

  <title>$_name</title>
  <link rel="manifest" href="manifest.json">

  <!-- Windows -->
  <meta name="msapplication-TileColor" content="$_color">
  <meta name="msapplication-TileImage" content="icons/Icon-144.png">
  <meta name="theme-color" content="$_color">

</head>
<body>
  <!-- This script installs service_worker.js to provide PWA functionality to
       application. For more information, see:
       https://developers.google.com/web/fundamentals/primers/service-workers -->
  <script>
    if ('serviceWorker' in navigator) {
      window.addEventListener('load', function () {
        navigator.serviceWorker.register('flutter_service_worker.js');
      });
    }
  </script>
  <script src="main.dart.js" type="application/javascript"></script>
</body>
</html>
''';

String pwaManifest(String _color) => '''
{
    "name": "$_name",
    "short_name": "${_name.toLowerCase()}",
    "start_url": ".",
    "display": "standalone",
    "background_color": "$_color",
    "theme_color": "$_color",
    "description": "$_name",
    "orientation": "natural",
    "prefer_related_applications": false,
    "icons": [
        {
            "src": "icons/Icon-72.png",
            "sizes": "72x72",
            "type": "image/png",
            "purpose": "any maskable"
        },
        {
            "src": "icons/Icon-96.png",
            "sizes": "96x96",
            "type": "image/png",
            "purpose": "any maskable"
        },
        {
            "src": "icons/Icon-128.png",
            "sizes": "128x128",
            "type": "image/png",
            "purpose": "any maskable"
        },
        {
            "src": "icons/Icon-144.png",
            "sizes": "144x144",
            "type": "image/png",
            "purpose": "any maskable"
        },
        {
            "src": "icons/Icon-152.png",
            "sizes": "152x152",
            "type": "image/png",
            "purpose": "any maskable"
        },
        {
            "src": "icons/Icon-192.png",
            "sizes": "192x192",
            "type": "image/png",
            "purpose": "any maskable"
        },
        {
            "src": "icons/Icon-384.png",
            "sizes": "384x384",
            "type": "image/png",
            "purpose": "any maskable"
        },
        {
            "src": "icons/Icon-512.png",
            "sizes": "512x512",
            "type": "image/png",
            "purpose": "any maskable"
        }
    ],
    "splash_pages": null
}

''';
