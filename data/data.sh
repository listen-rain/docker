#!/bin/bash

docker run \
	-v /www/huanle:/www/huanle \
	-v /www/self:/www/self \
	--name=data \
	-dit centos:7.2.1511

