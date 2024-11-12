FROM centos:centos7

ENV yum_repo=http://mirrors.aliyun.com/repo/Centos-altarch-7.repo \
    base_repo=/etc/yum.repos.d/CentOS-Base.repo

RUN mv $base_repo $base_repo.back \
	&& curl -o $base_repo $yum_repo

WORKDIR /app

ADD Dockerfile .

CMD ["/bin/bash"]

