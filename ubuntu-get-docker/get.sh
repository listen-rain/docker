#!/bin/bash

curl -fsSL get.docker.com -o get-docker.sh \
 && sudo sh get-docker.sh --mirror Aliyun \
 && sudo systemctl enable docker \
 && sudo systemctl start docker \
 && sudo touch /etc/docker/daemon.json \
 && sudo echo '{ "registry-mirrors": [ "https://49ec9s6u.mirror.aliyuncs.com" ] }' > /etc/docker/daemon.json \
 && sudo systemctl restart docker \
 && sudo docker info

# docker login --username=weiwei15275049388 registry.cn-hangzhou.aliyuncs.com
  
