#!/bin/bash

#cd /work/docker && docker run -dit --name=mycentos72php -v `pwd`/huanle:/www -v `pwd`/self:/self  centos72php:v1 bash
cd /work/docker && docker run -dit --name=mycentos72php -v `pwd`/huanle:/huanle -v `pwd`/self:/self  registry.cn-shanghai.aliyuncs.com/listen/wei:centos72phpv1

#/usr/local/php/sbin/php-fpm


