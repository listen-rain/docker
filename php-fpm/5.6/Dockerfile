FROM php:5.6-fpm

RUN apt-get update \
 && apt-get install -y \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libpng-dev \
 && docker-php-ext-install -j$(nproc) \
  iconv \
  mcrypt \
  gd \
  pdo_mysql \
  mysqli \
  mysql		

