#!/bin/bash
docker run \
	-p 3307:3306 \
	-v `pwd`/my.cnf:/etc/my.cnf \
	--net phpweb_appnet \
	--ip 172.19.0.100 \
	-v `pwd`/data:/var/lib/mysql \
	-e MYSQL_ROOT_PASSWORD='root' \
	--name=mysql55 \
	-d mysql:5.5.58 --user=mysql

