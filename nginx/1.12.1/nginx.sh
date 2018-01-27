#!/bin/bash
docker run \
        -p 80:80 \
        -p 443:443 \
        -v `pwd`/nginx.conf:/usr/local/nginx/conf/nginx.conf \
        -v `pwd`/vhost:/usr/local/nginx/conf/vhost \
	-v `pwd`/logs:/usr/local/nginx/logs \
        --volumes-from data \
        --name=nginx \
        -d registry.cn-hangzhou.aliyuncs.com/listen/nginx:1.12.1
