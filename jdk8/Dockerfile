#
# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       registry.aliyuncs.com/glodonedu/centos:7.1
MAINTAINER lp

#ADD jdk-8u91-linux-x64.tar.gz /usr/local

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-linux-x64.tar.gz && \
	tar -xvf jdk-8u91-linux-x64.tar.gz -C /usr/local && \
	rm -rf jdk-8u91-linux-x64.tar.gz

ENV JAVA_HOME /usr/local/jdk1.8.0_91
ENV CLASSPATH $JAVA_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin
