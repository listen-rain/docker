FROM registry.cn-hangzhou.aliyuncs.com/listen/php-fpm:7.1.15-pdomysql

RUN pear config-set http_proxy http://duotai:yE7VLSSrOoMs@hyatt.h.timonit.cn:19789 \
	&& pear install PHP_CodeSniffer \
	&& phpcs --config-set encoding 'utf-8' \
	&& pear config-set http_proxy ''

