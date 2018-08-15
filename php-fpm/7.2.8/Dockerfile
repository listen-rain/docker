FROM php:7.2.8-fpm

RUN echo "alias ls='ls --color=auto' \nalias l='ls -lah' \nalias ll='l'" >>  ~/.bashrc \
	&& . ~/.bashrc

RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer

RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

RUN apt-get update && apt-get install -y --no-install-recommends \
	libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd pdo_mysql iconv mcrypt \
    && rm -rf /var/lib/apt/lists/*

# local install needs VPN
# pear config-set http_proxy 'VPN'
# pear config-set http_proxy ''

# RUN apt-get update && apt-get install -y --no-install-recommends \
#	libzip-dev libzip2 git \
#    && pecl install redis \
#    && pecl install zip \
#    && pecl install apcu \
#    && pecl install xdebug \
#    && pecl install mongodb \
#    && pear install PHP_CodeSniffer \
#    && phpcs --config-set encoding 'utf-8' \
#    && docker-php-ext-enable redis apcu xdebug mongodb zip \
#    && rm -rf /var/lib/apt/lists/*

WORKDIR /www

