FROM zhufengwei/docker:cnpm
 
COPY start.sh /usr/local/bin/

RUN chmod a+x /usr/local/bin/start.sh && ln -s /usr/local/bin/start.sh /start.sh

ENTRYPOINT ["/start.sh"]

VOLUME /www

WORKDIR /www

EXPOSE 4000

