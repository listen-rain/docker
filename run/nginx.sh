#!/bin/bash

cd dockers \
	&& mkdir nginx \
	&& mkdir nginx/logs \
	&& mkdir nginx/conf.d 

docker run -p 80:80  \
	-v `pwd`/nginx/logs:/etc/nginx/logs \
	-v `pwd`/nginx/conf.d:/etc/nginx/conf.d \
	--name=mynginx \
	--link=myphp:php  \
	--volumes-from php \
	-d nginx

