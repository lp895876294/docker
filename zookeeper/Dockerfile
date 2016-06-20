#
# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       registry.aliyuncs.com/glodonedu/jdk:1.8
MAINTAINER lp

RUN wget http://mirrors.cnnic.cn/apache/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz && \ 
	tar -xvf zookeeper-3.4.8.tar.gz -C /opt && \
	rm -rf zookeeper-3.4.8.tar.gz

#ADD zookeeper-3.4.8.tar.gz /opt/
ADD zoo.cfg /opt/zookeeper-3.4.8/conf
ADD initzk.sh /opt/zookeeper-3.4.8
ADD supervisor_zk.conf /etc/supervisor.conf.d/

env ZOOKEEPER_HOME /opt/zookeeper-3.4.8

