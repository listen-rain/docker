FROM php:7.1.15-fpm

RUN echo -e "alias l='ls -lah'\nalias ll='l'\n" >> ~/.bashrc 

RUN apt-get update && apt-get install -y \
	libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd pdo_mysql iconv mcrypt 

# RUN pear config-set http_proxy 'http://duotai:yE7VLSSrOoMs@hyatt.h.timonit.cn:19789' \
RUN  pecl install redis \
    && apt-get update && apt-get install -y libzip-dev libzip2 && pecl install zip \
    && pecl install apcu \
    && pecl install xdebug \
    && pecl install mongodb \
    && pear install PHP_CodeSniffer \
    && phpcs --config-set encoding 'utf-8' \
    && docker-php-ext-enable redis apcu xdebug mongodb zip \
    && pear config-set http_proxy ''

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

RUN apt-get -y update \
        && apt-get -y install vim --no-install-recommends \
        && rm -rf ~/.bash_history \
        && rm -rf /tmp/* /var/log/* /var/cache/*

WORKDIR /www

