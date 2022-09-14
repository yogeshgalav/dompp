#!/bin/sh
APP_DIRECTORY = "app"

cd ./htdocs/$APP_DIRECTORY

chmod +rwx .
chmod -R 777 ./{app,database,resources,routes}

composer install

composer dump-autoload

php artisan config:clear

php artisan config:cache

php artisan route:cache

npm install

npm rebuild node-sass