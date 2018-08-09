#!/bin/bash
docker run \
	-p 3306:3306 \
	-v `pwd`/data:/var/lib/mysql  \
	-v /my/conf.d:/etc/mysql/conf.d  \
	-e MYSQL_ROOT_PASSWORD='root' \
	--name=mysql57 \
	-d mysql:5.7.20

