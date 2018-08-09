#!/bin/bash

docker run \
	-p 6379:6379 \
	-v $PWD/redis.conf:/usr/local/etc/redis/redis.conf \
	-v $PWD/data:/data \
	--name redis \
	-d redis:3.2 redis-server /usr/local/etc/redis/redis.conf 

