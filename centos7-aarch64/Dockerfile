FROM centos:centos7

ENV yum_repo=http://mirrors.aliyun.com/repo/Centos-altarch-7.repo \
    base_repo=/etc/yum.repos.d/CentOS-Base.repo

RUN mv $base_repo $base_repo.back \
	&& curl -o $base_repo $yum_repo

# RUN yum clean all \
#	&& yum makecache \
#	&& yum -y update \
#	&& yum -y install net-tools vim \
#	&& yum -y install gdb less libunwind gperftools graphviz ghostscript

WORKDIR /app

ADD Dockerfile /app

CMD ["/bin/bash"]

