FROM php:7.1-apache

# Set working directory
WORKDIR /var/www/html/

RUN apt-get update
RUN  apt-get install -y curl
RUN  apt-get install -y mariadb-client
RUN  apt-get install -y libmcrypt-dev
RUN  apt-get install -y libfreetype6-dev
RUN  apt-get install -y libjpeg62-turbo-dev
RUN  apt-get install -y libpng-dev

# Install extensions using the helper script provided by the base image
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd
RUN docker-php-ext-enable pdo_mysql
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-png

# Clean up apt cache
RUN rm -rf /var/lib/apt/lists/*
