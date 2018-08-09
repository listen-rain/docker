FROM centos72

ENV PCRE_VERSION 8.39
ENV NGINX_VERSION 1.12.1
ENV NGINX_BASEDIR /usr/local/nginx

# download from baiduyun
COPY pcre-$PCRE_VERSION.tar.bz2 /
COPY nginx-$NGINX_VERSION.tar.gz /

RUN mkdir /data && cd /data && mv /nginx-$NGINX_VERSION.tar.gz ./ && mv /pcre-$PCRE_VERSION.tar.bz2 ./ \
 && yum -y install make autoconf* bzip2 zlib zlib-devel gcc-c++ libtool openssl openssl-devel \
 && tar -jxvf pcre-$PCRE_VERSION.tar.bz2 && cd pcre-$PCRE_VERSION \
 && ./configure && make && make install \
 && groupadd www && useradd -g www -s /usr/sbin/nologin www \
 && cd /data && tar -zxvf nginx-$NGINX_VERSION.tar.gz && cd nginx-$NGINX_VERSION \
 && ./configure --prefix=$NGINX_BASEDIR --user=www --group=www --with-debug --with-pcre --with-http_stub_status_module --with-http_ssl_module \
 && make && make install \
 && yum -y remove make bzip2 gcc gcc-c++  autoconf* && yum clean all \
 && cd / && rm -rf /data /var/lib/yum/* \
 && cp /usr/local/nginx/sbin/nginx /usr/local/sbin \
 && mkdir -p /etc/nginx && chmod a+w /etc/nginx
	
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

