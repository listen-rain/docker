FROM centos

RUN yum -y update \
	&& yum -y install libpcap \
	&& curl -L -O https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-5.6.6-x86_64.rpm \
	&& sudo rpm -vi packetbeat-5.6.6-x86_64.rpm \
	&& rm -f packetbeat-5.6.6-x86_64.rpm \
	&& yum clean all \
	&& rm -rf /var/cache/yum/* 

COPY entrypoint.sh /bin/entrypoint.sh

RUN chmod 755 /bin/entrypoint.sh

ENTRYPOINT ["/bin/entrypoint.sh"]

CMD ['-']

