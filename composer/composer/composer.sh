#!/bin/bash

docker run \
	--rm --interactive --tty \
   	--volume $PWD:/app \
   	composer "$@" --ignore-platform-reqs --no-scripts

