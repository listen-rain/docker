#!/bin/bash

ImgID="$1"
IsImg=""

TopVersion="php-fpm"
Version="7.1.15-all"

if [ "$2" != "" ];then
	Version="$2"
fi

if [ "$3" != "" ];then
	TopVersion="$3"
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

