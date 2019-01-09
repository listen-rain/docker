#!/bin/bash

if [[ -f get-docker.sh ]];then
	
fi
sh get-docker.sh --mirror Aliyun \
 && mkdir -p /etc/docker \
 && touch /etc/docker/daemon.json \
 && echo "{ \"registry-mirrors\": [ \"https://$1.mirror.aliyuncs.com\" ] }" > /etc/docker/daemon.json \
 && systemctl enable docker \
 && systemctl start docker \
 && docker info

