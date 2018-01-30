FROM docker.elastic.co/beats/packetbeat:5.6.6

COPY packetbeat.yml /usr/share/packetbeat/packetbeat.yml

USER root

RUN chown packetbeat /usr/share/packetbeat/packetbeat.yml

USER packetbeat

