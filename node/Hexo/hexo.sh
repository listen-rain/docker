#!/bin/bash 

docker run -it \
	--name myhexo \
	-p 4000:4000 \
	-v /www:/www \
	-d hexo

