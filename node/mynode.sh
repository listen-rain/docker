#!/bin/bash

docker run -it --name mynode -p 3000:3000 -p 4000:4000 -v /www:/www -d registry.cn-hangzhou.aliyuncs.com/listen/node:latest bash

