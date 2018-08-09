#!/bin/bash

docker run -it --name cnpm -p 3000:3000 -p 4000:4000 -v /www:/www -d registry.cn-hangzhou.aliyuncs.com/listen/cnpm:latest bash 

