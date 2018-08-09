FROM php:7.2.8-fpm

RUN echo "alias ls='ls --color=auto' \nalias l='ls -lah' \nalias ll='l'" >>  ~/.bashrc \
	&& . ~/.bashrc

RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer

RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com
