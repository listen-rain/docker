FROM centos:7.4.1708

RUN echo -e "alias l='ls -lah'\n alias ll='l'" >> ~/.bashrc  

RUN yum -y update && yum -y install wget \
	&& wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
	&& rpm -ivh epel-release-latest-7.noarch.rpm \
	&& yum -y remove wget \
	&& yum clean all \
	&& history -c \
	&& rm -rf ~/.bash_history \
	&& rm -rf /tmp/* /var/log/* /var/cache/* 

CMD ['/bin/bash']

