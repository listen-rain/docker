#!/bin/bash

docker run \
	--name centos \
	-v /www:/www \
	-it \
	-d centos
