#!/bin/bash 

docker run -it \
	--name myhexo \
	-p 4000:4000 \
	--restart always \
	-v /www:/www \
	-d zhufengwei/docker:hexo
	

