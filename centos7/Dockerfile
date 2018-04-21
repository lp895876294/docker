#
# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       centos:centos7.1.1503
MAINTAINER lp

ENV TZ "Asia/Shanghai"
ENV TERM xterm

ADD aliyun-mirror.repo /etc/yum.repos.d/CentOS-Base.repo
ADD aliyun-epel.repo /etc/yum.repos.d/epel.repo

RUN yum install -y curl wget tar bzip2 unzip vim-enhanced passwd sudo yum-utils hostname net-tools rsync man && \
    yum install -y gcc gcc-c++ git make automake cmake patch logrotate python-devel libpng-devel libjpeg-devel && \
    yum install -y --enablerepo=epel pwgen python-pip && \
    yum clean all

RUN pip install supervisor
ADD supervisord.conf /etc/supervisord.conf

RUN mkdir -p /etc/supervisor.conf.d && \
    mkdir -p /var/log/supervisor

EXPOSE 22

#start supervisord and bash command
ENTRYPOINT /usr/bin/supervisord -c /etc/supervisord.conf ; /usr/bin/bash

ENV LANG en_US.UTF-8

