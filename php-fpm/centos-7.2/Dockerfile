FROM centos:7.5.1804

RUN yum install epel-release -y \
	&& rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm \
	&& yum install -y \
		php72w \
		php72w-cli \
		php72w-common \
		php72w-devel \
		php72w-embedded \
		php72w-fpm \
		php72w-gd \
		php72w-mbstring \
		php72w-mysqlnd \
		php72w-opcache \
		php72w-pdo \
		php72w-xml

CMD ["/usr/sbin/php-fpm", "-F"]

WORKDIR /www

