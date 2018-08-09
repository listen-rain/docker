#!/bin/bash

if [ ! -d /hexo ];then
    mkdir /hexo
fi

cd /hexo

cnpm install hexo-cli -g 
        
if [ ! -d "/hexo/blog" ];then
    hexo init blog 
    sleep 20s
fi 

cd blog \
    && cnpm install \
    && hexo server 

