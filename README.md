

## ***DOMPP***

DOMPP is a combination of Docker, Nginx, Mysql, Php and PhpMyAdmin.
This package is made for php or Laravel developers who want to start learning docker or people who are frustrated from software like Xampp, Wampp
For running this package you just need docker to be installed on your os.
For windows the docker would require wsl2 or linux kernel.
and then run the command

    docker-compose up -d

If it shows no error you can check

    http://localhost

1. Create or copy your project in htdocs,
2. Change PROJECT_DIR in env file,

**By default the nginx will read your public/index.html
this is done due to laravel default configuration.**

If you want to change nginx configuration, check nginx/default.conf

**By defaul mysql will run on port 3306,
and phpmyadmin will run on port localhost:8183**

You also get composer and node already installed in php container, so you can easily run applications like Laravel

Further more we have provided laravel_build.sh and laravel_deploy.sh to help Laravel developers

If you want to access phpmyadmin go to localhost:8183  

    Server: "mysql"
    Username: "root"
    Password: "root"

If you want to change ports or version or default configuration,
Make your changes in .env file
and don't forget to restart your containers.

If you want to edit php.ini for memory setting, go to php directory and edit php.ini

If you want to change version of php version,
You can find certain set of supported php dockerfile inside php directory,
You can also create one of your own or edit existing according to your needs.
then change PHP_DOCKERFILE in env file.
You may need to rebuild image with --no-cache, if had you build it once.

You can also change mysql port if 3306 is already occupied on your system.
Or phpmyadmin port
Just change env file.

Thank you and have a nice day.