FROM registry.cn-hangzhou.aliyuncs.com/listen/cnpm:latest

RUN cd / && mkdir hexo
 
COPY docker-entrypoint.sh /usr/local/bin/

RUN ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat

ENTRYPOINT ["docker-entrypoint.sh"]

VOLUME /hexo

EXPOSE 4000

