FROM php-fpm:7.1.15-pdomysql

RUN pear config-set http_proxy http://duotai:yE7VLSSrOoMs@hyatt.h.timonit.cn:19789 \
    && pecl install mongodb \
    && docker-php-ext-enable mongodb \
    && pear config-set http_proxy ''
