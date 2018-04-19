FROM registry.cn-hangzhou.aliyuncs.com/listen/cnpm:latest

RUN cd / && mkdir hexo
 
COPY start.sh /usr/local/bin/

RUN ln -s /usr/local/bin/start.sh /start.sh

ENTRYPOINT ["/start.sh"]

VOLUME /hexo

EXPOSE 4000

