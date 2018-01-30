#!/bin/bash

docker run \
	--cap-add=NET_ADMIN \
	--network=host \
	--name packetbeat \
	packetbeat

# 	-it \
#	docker.elastic.co/beats/packetbeat:5.6.6
#	-d docker.elastic.co/beats/packetbeat:5.6.6

