#!/bin/bash

docker run -it \
        --name mynode \
        -p 4000:4000 \
        -v /www:/www \
	--restart always \	
        -d node bash

