#!/bin/bash

docker run \
	-p 9001:9000 \
	-v `pwd`/conf.d:/usr/local/etc/php/conf.d \
	-v /www:/www \
	--net=phpweb_appnet \
	--ip 172.19.0.20 \
	--name php56 \
	-d registry.cn-hangzhou.aliyuncs.com/listen/php-fpm-5.6

