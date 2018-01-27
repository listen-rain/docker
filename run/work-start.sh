#!/bin/bash

docker start data 		# 172.17.0.2
docker start offmysql57    	# 172.17.0.3
docker start nginx      	# 172.17.0.4
docker start crontab    	# 172.17.0.5
docker start php707 		# 172.17.0.6
docker start php53              # 172.17.0.7
docker start mysql55            # 172.17.0.8
# docker start php71              # 172.17.0.9

sudo iptables -t nat -A DOCKER -p tcp --dport 8080 -j DNAT --to-destination 172.17.0.4:8080  	# babyadmin.conf
sudo iptables -t nat -A DOCKER -p tcp --dport 8081 -j DNAT --to-destination 172.17.0.4:8081	# testlv.conf
sudo iptables -t nat -A DOCKER -p tcp --dport 8082 -j DNAT --to-destination 172.17.0.4:8082	# appData.conf
sudo iptables -t nat -A DOCKER -p tcp --dport 8083 -j DNAT --to-destination 172.17.0.4:8083	# baby.conf

