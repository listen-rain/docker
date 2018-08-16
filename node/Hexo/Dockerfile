FROM zhufengwei/docker:cnpm

RUN cd / && mkdir hexo
 
COPY start.sh /usr/local/bin/ 

RUN chmod a+x /usr/local/bin/start.sh && ln -s /usr/local/bin/start.sh /start.sh

ENTRYPOINT ["/start.sh"]

VOLUME /hexo

WORKDIR /hexo

EXPOSE 4000

