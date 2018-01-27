FROM 	centos:7.2.1511

ENV 	PHP_VERSION 7.0.7

RUN     mkdir /data

COPY 	php-$PHP_VERSION.tar.gz /data
COPY    libmcrypt-2.5.8.tar.gz /data
COPY    mcrypt-2.6.8.tar.gz /data
COPY    mhash-0.9.9.9.tar.gz /data

RUN 	cd /data \
    	&& yum -y update \
	&& yum -y install \
		make gcc gcc-c++ autoconf* automake zlib zlib-devel openssl openssl-devel \                                                    
                pcre pcre-devel libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel curl-devel libxslt-devel psmisc \
	&& tar -zxvf libmcrypt-2.5.8.tar.gz && rm -f libmcrypt-2.5.8.tar.gz \
        && cd libmcrypt-2.5.8 \
   	&& ./configure \
	&& make && make install \
	&& cd /data \
	&& tar -zxvf mhash-0.9.9.9.tar.gz && rm -f mhash-0.9.9.9.tar.gz \
	&& cd mhash-0.9.9.9 \
	&& ./configure \
	&& make && make install \
	&& cd /data \
	&& tar -zxvf mcrypt-2.6.8.tar.gz && rm -f mcrypt-2.6.8.tar.gz \
	&& cd mcrypt-2.6.8 \
	&& LD_LIBRARY_PATH=/usr/local/lib ./configure \
	&& make && make install \
	&& cd /data \
	&& tar -zxvf php-$PHP_VERSION.tar.gz \
	&& rm -f php-$PHP_VERSION.tar.gz \
	&& cd php-$PHP_VERSION \
    	&& ./configure \
		--prefix=/usr/local/php \
		--with-mysqli=mysqlnd \
		--with-pdo-mysql=mysqlnd \
		--with-freetype-dir \
		--with-gd \
		--with-zlib \
		--with-libxml-dir \
		--with-jpeg-dir \
		--with-png-dir \
		--enable-mbstring \
		--enable-mbregex \
		--with-mcrypt \
		--enable-fpm \
		--enable-shared \
		--with-openssl \
		--with-curl \
		--with-config-file-path=/usr/local/php/etc \
		--enable-debug \
		--enable-zip \
		--enable-xml \
		--enable-opcache \
    	&& make \
	&& make install \
    	&& cp php.ini-development /usr/local/php/etc/php.ini \
    	&& cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf \
    	&& cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf \
    	&& sed -i "s/^\(listen\).*\(127.0.0.1\)\(:9000\)$/\1=0.0.0.0\3/" /usr/local/php/etc/php-fpm.d/www.conf \
    	&& cp /usr/local/php/sbin/php-fpm /usr/sbin/php-fpm \
    	&& yum -y remove make  gcc gcc-c++ autoconf* automake \
    	&& yum clean all \
	&& rm -rf /var/cache/yum/* \
	&& rm -rf /data 
 
CMD ["php-fpm","-F"]

