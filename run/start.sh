#!/bin/bash

# 以下使用端口转发的方式为nginx容器动态添加映射端口。
# 注意：centos7 下不能使用下面的方式，因为centos7默认使用firewall做的防火墙，
# 	如果想使用下面的方式必须先禁用firewall防火墙，并安装iptables防火墙，
#       也可以使用 `commit 容器ID 镜像名称:镜像版本` 提交一个nginx镜像，
#	在此镜像的基础上，启动一个容器，与原nginx容器共用同样数据卷(包括配置文件、日志文件)，在新容器加上需要的映射端口，
# 	从而实现添加端口的需求，注意：重启nginx容器时，要重启添加了端口的新nginx容器 

# 访问宿主机的8080端口，分发到nginx的8080端口，172.17.0.4是nginx容器的IP地址
# sudo iptables -t nat -A DOCKER -p tcp --dport 8080 -j DNAT --to-destination 172.17.0.4:8080  	

# 暂不启动服务
# php53、offmysql56、php56、redis

dservers=(data offmysql57 nginx php707 mysql55)

#启动的服务
for i in "${dservers[*]}" 
do
	docker start $i
done
exit

