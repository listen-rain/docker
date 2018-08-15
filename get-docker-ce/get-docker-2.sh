#!/bin/bash
sh get-docker.sh --mirror Aliyun \
 && systemctl enable docker \
 && systemctl start docker \
 && touch /etc/docker/daemon.json \
 && echo "{ \"registry-mirrors\": [ \"https://$1.mirror.aliyuncs.com\" ] }" > /etc/docker/daemon.json \
 && docker info

