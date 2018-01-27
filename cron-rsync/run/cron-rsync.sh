#!/bin/bash
docker run \
	--volumes-from data \
	--name=crontab \
	-dit registry.cn-hangzhou.aliyuncs.com/listen/crontab-rsync
