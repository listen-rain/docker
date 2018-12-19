#!/bin/bash
sh get-docker.sh --mirror Aliyun \
 && touch /etc/docker/daemon.json \
 && echo "{ \"registry-mirrors\": [ \"https://$1.mirror.aliyuncs.com\" ] }" > /etc/docker/daemon.json \
 && systemctl enable docker \
 && systemctl start docker \
 && docker info

