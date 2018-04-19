FROM registry.cn-hangzhou.aliyuncs.com/listen/node:latest

RUN mkdir /hexo && cd /hexo \
	&& npm install hexo-cli -g \
	&& hexo init blog \
	&& cd blog \
	&& npm install 

VOLUME /hexo

EXPOSE 4000

CMD ["hexo server"]

