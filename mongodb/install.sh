#!/bin/bash

docker run \
	-p 27017:27017 \
	-v $PWD/data:/data/db \
	--net=phpweb_appnet \
	--ip 172.19.0.30 \
	--name mongo -d mongo

# CLI-Usage: docker exec -it mongo mongo
