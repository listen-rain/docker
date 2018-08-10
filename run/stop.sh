#!/bin/bash

all=""

if [[ $2 == "a" ]]
then 
	all="-a"	
fi

containers=$(docker ps $all | awk '{print $1}' | grep -v 'CONTAINER')

for container in $containers
do
	docker stop $container
	
	if [[ $1 == "rm" ]]
	then
		echo $container
		docker rm -v $container
	fi	
done

exit

