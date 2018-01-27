#!/bin/bash

docker run --name offmysql56 \
	-p 3308:3306 \
	--network compose_appnet \
	--ip 172.19.0.6 \
	-v `pwd`/conf.d:/etc/mysql/conf.d \
	-v `pwd`/data:/var/lib/mysql \
	-e MYSQL_ROOT_PASSWORD='root' \
	-d mysql:5.6.38 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

