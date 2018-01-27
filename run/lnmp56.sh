#!/bin/bash

docker run -dit -p 8090:8090 -p 8091:8091 -p 3306:3306  -v `pwd`/mysql/my.cnf:/etc/my.cnf -v `pwd`/mysql/data:/usr/local/mysql/var -v `pwd`/nginx/conf/vhost:/usr/local/nginx/conf/vhost -v `pwd`/nginx/conf/nginx.conf:/usr/local/nginx/conf/nginx.conf -v `pwd`/nginx/logs:/home/wwwlogs -v `pwd`/phpfpm/logs:/usr/local/php/logs -v `pwd`/phpfpm/php.ini:/usr/local/php/etc/php.ini -v /work/docker/huanle:/huanle --name=mylnmp56 lnmp56

# /usr/local/nginx/sbin/nginx &

# /usr/local/php/sbin/php-fpm &

# 注意：如果是首次启动需要初始化
# /usr/local/mysql/bin/mysqld_safe --defaults-file=/etc/my.cnf --user=mysql &

# 报错
# Warning: World-writable config file '/etc/my.cnf' is ignored # 更改 my.cnf 文件权限不可写即可

# Logging to '/usr/local/mysql/data/b0b6ef711f4e.err'. # 查看 此错误文件的具体错误进行解决

# /usr/local/nginx/sbin/nginx -s reload
