#!/bin/bash

if [[ -f get-docker.sh ]];then
    echo "正在安装..." \
            && sh get-docker.sh --mirror Aliyun \
            && sudo systemctl enable docker \
            && sudo systemctl start docker \
	    && sudo docker info
fi

if [[ -n $1 ]];then
    echo "正在更换为国内镜像..." \
        && sudo mkdir -p /etc/docker \
	&& sudo chmod -R 777 /etc/docker \
        && touch /etc/docker/daemon.json \
        && echo "{ \"registry-mirrors\": [ \"https://$1.mirror.aliyuncs.com\" ] }" > /etc/docker/daemon.json \
        && sudo systemctl restart docker \
        && sudo docker info
fi

