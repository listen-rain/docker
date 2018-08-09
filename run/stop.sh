#!/bin/bash

for container in $(docker ps | awk '{print $1}' | grep -v 'CONTAINER')
do
	docker stop $container
done

exit

