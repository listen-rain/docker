FROM registry.cn-hangzhou.aliyuncs.com/listen/php-fpm:7.1.15-all

RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

RUN yum -y update \
	&& yum -y install vim \
	&& yum clean all \
	&& rm -rf ~/.bash_history \
	&& rm -rf /tmp/* /var/log/* /var/cache/* \
	&& history -c 

WORKDIR /www
 

