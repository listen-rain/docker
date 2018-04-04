FROM php:7.1.15-fpm

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN pear config-set http_proxy http://duotai:yE7VLSSrOoMs@hyatt.h.timonit.cn:19789 \
    && pecl install redis \
    && pecl install apcu \
    && pecl install xdebug \
    && docker-php-ext-enable redis apcu xdebug mcrypt \
    && pear config-set http_proxy ''

