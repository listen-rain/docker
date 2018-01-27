#!/bin/bash

# docker run -it --name=lnmp53 3f7a18e2038d bash
# 一键安装lnmp

# mkdir lnmp53 
# cd lnmp53
# mkdir nginx
# cd nginx
# docker cp lnmp53:/usr/local/nginx/conf ./
# docker cp lnmp53:/home/wwwlogs ./
# mv wwwlogs/ logs

# cd ..
# mkdir mysql
# cd mysql
# docker cp lnmp53:/usr/local/mysql/var ./
# mv var data
# docker cp lnmp53:/etc/my.cnf ./

# mkdir phpfpm
# cd phpfpm
# docker cp lnmp53:/usr/local/php/etc/php.ini ./
# mkdir logs

docker run -dit -p 8090:8090 -p 8091:8091 -p 3306:3306  -v `pwd`/mysql/my.cnf:/etc/my.cnf -v `pwd`/mysql/data:/usr/local/mysql/var -v `pwd`/nginx/conf:/usr/local/nginx/conf -v `pwd`/nginx/logs:/home/wwwlogs -v `pwd`/phpfpm/logs:/usr/local/php/logs -v `pwd`/phpfpm/php.ini:/usr/local/php/etc/php.ini -v /work/docker/huanle:/huanle -v /work/docker/self:/self --name=mylnmp53 lnmp53


docker exec -it mylnmp53 bash
/usr/local/php/sbin/php-fpm &
/usr/local/nginx/sbin/nginx &
/usr/local/mysql/bin/mysqld_safe --user=mysql & 	# 可能需要修改宿主机中的my.cnf的权限

# mysql -uroot -p
# update user set host='%' where host='127.0.0.1' and user='root';
# flush privileges;

