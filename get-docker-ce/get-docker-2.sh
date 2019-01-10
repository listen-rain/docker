#!/bin/bash

if [[ -f get-docker.sh ]];then
    echo "正在安装..." \
	    && sh get-docker.sh --mirror Aliyun \
	    && systemctl enable docker \
	    && docker info
fi

if [[ -n $1 ]];then
    echo "正在更换为国内镜像..." \
        && mkdir -p /etc/docker \
        && touch /etc/docker/daemon.json \
        && echo "{ \"registry-mirrors\": [ \"https://$1.mirror.aliyuncs.com\" ] }" > /etc/docker/daemon.json \
        && systemctl start docker \
        && docker info
fi
