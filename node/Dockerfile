FROM registry.cn-hangzhou.aliyuncs.com/listen/centos:latest

RUN yum -y update \
	&& yum -y install nodejs \
	&& yum clean all \
	&& history -c \
	&& rm -rf ~/.bash_history \
	&& rm -rf /tmp/* /var/log/* /var/cache/* 

EXPOSE 3000

