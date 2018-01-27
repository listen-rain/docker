#!/bin/bash
docker run \
	-p 3306:3306 \
	-v `pwd`/my.cnf:/etc/my.cnf \
	-v `pwd`/data:/var/lib/mysql \
	-e MYSQL_ROOT_PASSWORD='root' \
	--name=mysql55 \
	-d registry.cn-hangzhou.aliyuncs.com/listen/mysql:5.5.56 --user=mysql

