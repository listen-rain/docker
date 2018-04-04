#!/bin/bash

docker run \
	-p 9001:9000 \
	--name php71 \
	-v /www:/www \
	-v $PWD/conf.d:/usr/local/etc/php/conf.d \
	-v $PWD/logs:/logs \
	--net dudu_appnet \
	--ip 172.20.0.9 \
	-d php-fpm:7.1.15 

