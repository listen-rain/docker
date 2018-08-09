#!/bin/bash

docker run \
	-p 9002:9000 \
	--name php72 \
	-v /www:/www \
	-v $PWD/conf.d:/usr/local/etc/php/conf.d \
	-v $PWD/logs:/logs \
	--net 71-php_appnet \
	--ip 172.20.0.10 \
	-d php:7.2.8-fpm 

