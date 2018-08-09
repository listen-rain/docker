#!/bin/bash 

docker run -it \
	--name myhexo \
	-p 4000:4000 \
	-v /hexo:/hexo \
	-d registry.cn-hangzhou.aliyuncs.com/listen/node-hexo bash 
