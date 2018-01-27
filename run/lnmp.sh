#!/bin/bash

docker run -it -p 8080:8080 -p 8081:8081 -p 8082:8082 -p 3306:3306 --name=lnmp -v /work/docker/huanle:/huanle -v /work/docker/self:/self -v `pwd`/mysql/data:/usr/local/mysql/var -v `pwd`/mysql/my.cnf:/etc/my.cnf -v `pwd`/nginx/conf/vhost:/usr/local/nginx/conf/vhost -v `pwd`/nginx/conf/nginx.conf:/usr/local/nginx/conf/nginx.conf -v `pwd`/nginx/logs:/home/wwwlogs -v `pwd`/php/php.ini:/usr/local/php/etc/php.ini 033df544033a bash

docker run -it -p 8080:8080 -p 8081:8081 -p 8082:8082 -p 3306:3306 --name=lnmp -v /work/docker/huanle:/huanle -v /work/docker/self:/self -v `pwd`/mysql/data:/usr/local/mysql/var -v `pwd`/nginx/conf/vhost:/usr/local/nginx/conf/vhost -v `pwd`/nginx/conf/nginx.conf:/usr/local/nginx/conf/nginx.conf -v `pwd`/nginx/logs:/home/wwwlogs 033df544033a bash

# /usr/local/nginx/sbin/nginx &
# /usr/local/nginx/sbin/nginx -s reload

# /usr/local/php/sbin/php-fpm &

# rm -rf /usr/local/mysql/var/*
# /usr/local/mysql/bin/mysqld --initialize --user=mysql --datadir=/usr/local/mysql/var --basedir=/usr/local/mysql &

# /usr/local/mysql/bin/mysqld_safe --defaults-file=/etc/my.cnf --user=mysql & 

