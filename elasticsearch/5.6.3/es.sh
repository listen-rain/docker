#!/bin/bash
 
docker run \
	-p 9200:9200 \
	-v "$PWD/esdata":/usr/share/elasticsearch/data \
	--network phpweb_appnet \
	--ip 172.19.0.7 \
	--name es \
	-d elasticsearch:5.6.3 \
	-Etransport.host=0.0.0.0 \
	-Ediscovery.zen.minimum_master_nodes=1 \

#-v "$PWD/config":/usr/share/elasticsearch/config \

