#!/bin/bash

docker run \
	-v "$PWD/config/packetbeat.yml":/packetbeat.yml \
	--cap-add=NET_ADMIN \
	--network=host \
	--name packetbeat \
	docker.elastic.co/beats/packetbeat:5.6.6 packetbeat -c /packetbeat.yml

# 	-it \
#	docker.elastic.co/beats/packetbeat:5.6.6
#	-d docker.elastic.co/beats/packetbeat:5.6.6

