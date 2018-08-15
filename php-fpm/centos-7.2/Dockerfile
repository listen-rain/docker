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

RUN set -ex \
	&& cd /etc \
	&& if [ -d php-fpm.d ]; then \
	{ \
		echo '[global]'; \
		echo 'error_log = /proc/self/fd/2'; \
		echo; \
		echo '[www]'; \
		echo '; if we send this to /proc/self/fd/1, it never appears'; \
		echo 'access.log = /proc/self/fd/2'; \
		echo; \
		echo 'clear_env = no'; \
		echo; \
		echo '; Ensure worker stdout and stderr are sent to the main error log.'; \
		echo 'catch_workers_output = yes'; \
	} | tee php-fpm.d/docker.conf \
	&& { \
		echo '[global]'; \
		echo 'daemonize = no'; \
		echo; \
		echo '[www]'; \
		echo 'listen = 9000'; \
	} | tee php-fpm.d/zz-docker.conf

EXPOSE 9000

CMD ["/usr/sbin/php-fpm", "-F"]

WORKDIR /www

