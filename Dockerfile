FROM php:7.4-apache

# RUN apt update

# RUN apt install software-properties-common -y

# RUN add-apt-repository ppa:ondrej/php -y

RUN apt update

RUN apt install wget libzip-dev zlib1g-dev libpng-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev -y

RUN docker-php-ext-install mysqli zip gd

RUN wget https://getcomposer.org/download/1.10.23/composer.phar

RUN mv composer.phar /bin/composer

RUN chmod +x /bin/composer

COPY 000-default.conf /etc/apache2/sites-enabled

RUN a2enmod rewrite