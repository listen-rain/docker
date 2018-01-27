#!/bin/bash

docker run -v /work/docker/huanle:/www/huanle -v /work/docker/self:/www/self --name=data -dit centos72

