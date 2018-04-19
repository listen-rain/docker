FROM registry.cn-hangzhou.aliyuncs.com/listen/php-fpm:7.1.15-all

RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

RUN apt-get -y update \
	&& apt-get -y install vim --no-install-recommends \
	&& rm -rf ~/.bash_history \
	&& rm -rf /tmp/* /var/log/* /var/cache/* 

WORKDIR /www
 

