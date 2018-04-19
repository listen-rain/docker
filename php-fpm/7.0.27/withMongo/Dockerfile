FROM registry.cn-hangzhou.aliyuncs.com/listen/php-fpm-7.0.27

RUN apt-get update \
	&& apt-get install -y wget openssl libssl-dev --no-install-recommends \
	&& wget http://pecl.php.net/get/mongodb-1.2.9.tgz \
	&& tar zxvf mongodb-1.2.9.tgz \
	&& cd mongodb-1.2.9 \
	&& phpize \
	&& ./configure \
	&& make && make install \
	&& apt-get remove wget -y && rm -r /var/lib/apt/lists/* \
	&& rm -rf mongodb-1.2.9.tgz mongodb-1.2.9 \
	&& echo 'extension="mongodb.so"' >> /usr/local/etc/php/conf.d/mongo.ini
	
