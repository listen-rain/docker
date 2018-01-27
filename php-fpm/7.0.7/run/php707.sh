#!/bin.bash
docker run \
	-v `pwd`/php.ini:/usr/local/php/etc/php.ini \
	-v `pwd`/logs:/usr/local/php/logs \
	--volumes-from data \
	--name=php707 \	
	-d registry.cn-hangzhou.aliyuncs.com/listen/php-fpm:7.0.7
