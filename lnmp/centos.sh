#!/bin/bash

docker run \
	--name centos \
	-p 8080:80 \
	-p 3000:3000 \
	-v /www:/www \
	--net web_default \
	--ip 172.19.0.200 \
	-it \
	-d centos

	
