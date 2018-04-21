# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       registry.aliyuncs.com/glodonedu/jdk:1.8
MAINTAINER lp

ADD ./logstash.repo /etc/yum.repos.d/

RUN rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

RUN yum install -y logstash

#add path
ENV PATH $PATH:/usr/share/logstash/bin

#run as a daemon thread
ADD supervisor_logstash.conf /etc/supervisor.conf.d/

#logstash logs dir
RUN mkdir -p /logstash/conf && mkdir -p /logstash/logs
