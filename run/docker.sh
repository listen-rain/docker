#!/bin/bash

#containers=$(docker ps | cut -d ' ' -f 1 | sed -n '/[^A-Z]/p')
#containers=(` docker ps | awk '{print $NF}' | grep -v '[A-Z]' `)

containers=$(docker ps | awk '{print $NF}' | grep -v '[A-Z]' | xargs)

if [ "$1" == "start" -o "$1" == "rm" ];then
	containers=$(docker ps -a | awk '{print $NF}' | grep -v '[A-Z]' | xargs)
fi

if [ "$1" == "" ];then
	docker ps
	exit 1
fi

if [ "$2" != "" ];then
	containers="$2"
fi

for i in ${containers[*]}
do
	case "$1" in
		start)
			docker start "$i"
			;;
		stop)
			docker stop "$i"
			;;
		restart)
			docker restart "$i"
			;;
		rm)
			docker rm -v "$i"
			;;
		*)
			echo "Usage : (start|stop|restart|rm) to exec it!"
			;;
	esac		
done

exit

