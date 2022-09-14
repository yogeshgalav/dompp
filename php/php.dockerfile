FROM php:7.4-fpm

USER root

WORKDIR /var/www

# Install dependencies
RUN apt-get update \
    # gd
    && apt-get install -y --no-install-recommends build-essential  openssl nginx libfreetype6-dev libjpeg-dev libpng-dev libwebp-dev zlib1g-dev libzip-dev gcc g++ make vim unzip curl git jpegoptim optipng pngquant gifsicle locales libonig-dev nodejs npm  \
    && docker-php-ext-configure gd  \
    && docker-php-ext-install gd \
    # gmp
    && apt-get install -y --no-install-recommends libgmp-dev \
    && docker-php-ext-install gmp \
    # pdo_mysql
    && docker-php-ext-install pdo_mysql mbstring \
    # pdo
    && docker-php-ext-install pdo \
    # opcache
    && docker-php-ext-enable opcache \
    # zip
    && docker-php-ext-install zip \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/pear/

# Copy files
# COPY ./htdocs /var/www/

COPY ./php/php.ini /usr/local/etc/php/local.ini

COPY ./log.conf /usr/local/etc/php-fpm.d/zz-log.conf

# setup npm
RUN npm install -g npm@latest

# setup composer and laravel
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 80

# RUN ["chmod", "+x", "laravel_build.sh"]
# CMD [ "sh", "./laravel_build.sh" ]

# RUN ["chmod", "+x", "laravel_deploy.sh"]
# CMD [ "sh", "./laravel_deploy.sh" ]