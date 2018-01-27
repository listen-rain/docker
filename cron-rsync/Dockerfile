FROM ubuntu1604

RUN apt-get -y update \ 
 && apt-get -y install cron rsync openssh-server --no-install-recommends \
 && rm -rf /var/lib/apt/lists/*  

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["bash"]

