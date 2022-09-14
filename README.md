

## ***DOMPP***

DOMPP is a combination of Docker, Nginx, Mysql, Php and PhpMyAdmin.
This package is made for php or Laravel developers who want to start learning docker or people who are frustrated from software like Xampp, Wampp
for running this package you just need docker to be installed on your os.
and then run the command

    docker compose up

**By default your htdocs folder will point to port localhost:9000,
mysql will run on port 3306,
and phpmyadmin will run on port localhost:8183**

You also get composer and node already installed in php container, so you can easily run applications like Laravel

Further more we have provided laravel_build.sh and laravel_deploy.sh to help Laravel developers

If you want to access php file by path inside htdocs/

http://localhost:9000/path-to-index-file

If you want to serve php file, run cmd inside php container

    php -S localhost:8000 index.php

If you want to access phpmyadmin go to localhost:8183  

    Server: "mysql"
    Username: "root"
    Password: "root"

  

If you want to change ports or version or default configuration, run

    docker compose down

And after you are done with your changes again run

    docker compose up

**If you are new to docker few examples are given below.**

If you want to change port in url, goto to docker-compose.yml and change line 12

If you want to serve multiple applications, add ports to docker-compose.yml after line 12

    ports
    - "9000:8000"
    - "9001:8001"
    - "9002:8002"

If you want to edit php.ini for memory setting, go to php directory and edit php.ini

If you want to change version of php version,

change line 1 in php/php.dockerfile

If you want to change mysql version,
change docker-compose.yml line 30

If you want to change mysql port
change docker-compose.yml line 40

    ports:
    - 3306:3306

If you want to change phpmyadmin port

change docker-compose.yml line 58

    ports:
    - 8183:80
