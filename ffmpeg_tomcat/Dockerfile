#
# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       registry.aliyuncs.com/glodonedu/ffmpeg:2.8
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

# install java
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-linux-x64.tar.gz && \
    tar -xvf jdk-8u91-linux-x64.tar.gz -C /usr/local && \
	rm -rf jdk-8u91-linux-x64.tar.gz

ENV JAVA_HOME /usr/local/jdk1.8.0_91
ENV CLASSPATH $JAVA_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin

# install tomcat
RUN wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-7/v7.0.70/bin/apache-tomcat-7.0.70.tar.gz && \
	tar -xvf apache-tomcat-7.0.70.tar.gz -C /opt/  && \
	mv /opt/apache-tomcat-7.0.70 /opt/tomcat7 && \
	rm -rf apache-tomcat-7.0.70.tar.gz && \
	rm -rf /opt/tomcat7/webapps/* 

#add tomcat config
ADD conf/logging.properties /opt/tomcat7/conf/
ADD conf/server.xml /opt/tomcat7/conf/
ADD bin/catalina.sh /opt/tomcat7/bin/

ADD supervisor_tomcat.conf /etc/supervisor.conf.d/

#tomcat home
ENV TOMCAT_HOME /opt/tomcat7

expose 8080

