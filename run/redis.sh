#!/bin/bash

cd /work/dockers \
	&& mkdir redis \
	&& mkdir redis/data \
	&& docker run \
		--name myredis \
		-v `pwd`/redis/data:/data \
		-p 6380:6379 \
		-d redis redis-server --appendonly yes

