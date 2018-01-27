#!/bin/bash
docker run \
	-p 3306:3306 \
	-v `pwd`/my.cnf:/etc/my.cnf \
	-v `pwd`/data:/var/lib/mysql \
	-e MYSQL_ROOT_PASSWORD='root' \
	--name=mysql57 \
	-d registry.cn-hangzhou.aliyuncs.com/listen/mysql:mysql5.7.18 \
	--user=mysql \
	--explicit_defaults_for_timestamp
