#!/bin/bash
docker run \
        -p 80:80 \
        -p 443:443 \
        -v `pwd`/nginx.conf:/etc/nginx/nginx.conf \
        -v `pwd`/conf.d:/etc/nginx/conf.d \
	-v `pwd`/logs:/etc/nginx/logs \
        --name=nginx115 \
        -d nginx:1.15.7
