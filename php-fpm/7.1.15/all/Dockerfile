FROM registry.cn-hangzhou.aliyuncs.com/listen/php-fpm:php-fpm-7.1.15-phpcs

RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer \
	&& composer -v

