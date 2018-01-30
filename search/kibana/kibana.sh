#!/bin/bash

docker run \
	--name kibana \
	-e ELASTICSEARCH_URL=http://172.17.0.1:9200 \
	-p 5601:5601 \
	-d kibana:5.6.3

