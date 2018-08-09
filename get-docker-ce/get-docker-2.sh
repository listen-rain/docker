#!/bin/bash
sh get-docker.sh --mirror Aliyun \
 && systemctl enable docker \
 && systemctl start docker \
 && touch /etc/docker/daemon.json \
 && echo "{ \"registry-mirrors\": [ \"https://49ec9s6u.mirror.aliyuncs.com\" ] }" > /etc/docker/daemon.json \
 && docker info

