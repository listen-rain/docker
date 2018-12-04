#!/bin/bash

docker run \
	-p 9010:9000 \
	--name php71-swoole \
	-v /www:/www \
	-v $PWD/conf.d:/usr/local/etc/php/conf.d \
	-v $PWD/logs:/logs \
	--net web_default \
	--ip  172.19.0.100 \
	-d zhufengwei/docker:php-fpm7.1-swoole

