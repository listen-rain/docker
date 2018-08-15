FROM centos:7.5.1804

RUN yum -y update \
	&& yum -y install nodejs \
	&& yum clean all \
	&& history -c \
	&& rm -rf ~/.bash_history \
	&& rm -rf /tmp/* /var/log/* /var/cache/* 

EXPOSE 3000

