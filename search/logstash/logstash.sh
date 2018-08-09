#!/bin/bash

# basic usage
# docker run -it --rm logstash -e 'input { stdin { } } output { stdout { } }'

docker run -it \
	-p 5044:5044 \
	-v "$PWD"/config:/config \
	--name logstash \
	logstash:5.6.3 -f /config/logstash.conf

