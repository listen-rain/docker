#!/bin/bash

read -p "image ID: " ImgID
read -p "version: " Version
read -p "top version: " TopVersion

if [ "$Version" == "" ];then
	Version="7.1.15-all"
fi

if [ "$TopVersion" == "" ];then
	TopVersion="php-fpm"
fi

for i in `docker images | awk '{print $3}' | grep -v IMAGE`
do
	if [ "$ImgID" == $i ];then
		IsImg="1"
	fi
done

if [ "$IsImg" != "" ];then
	docker tag $ImgID registry.cn-hangzhou.aliyuncs.com/listen/$TopVersion:$Version \
	&& docker push registry.cn-hangzhou.aliyuncs.com/listen/$TopVersion:$Version 
else
	echo -e "Please Input A Valid Image ID!\n"
	exit 1
fi

exit 0

