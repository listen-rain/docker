#!/bin/bash

cd /work/docker && mkdir redis && mkdir redis/data && docker run --name myredis -v `pwd`/redis/data:/data -p 6379:6379 -d redis redis-server --appendonly yes

