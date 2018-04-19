FROM registry.cn-hangzhou.aliyuncs.com/listen/cnpm:latest

RUN mkdir /hexo && cd /hexo \
	&& cnpm install hexo-cli -g \
	&& hexo init blog \
	&& cd blog \
	&& cnpm install 

VOLUME /hexo

EXPOSE 4000

