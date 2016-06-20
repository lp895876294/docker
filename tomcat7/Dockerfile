#
# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       registry.aliyuncs.com/glodonedu/jdk:1.8
MAINTAINER lp

RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-7/v7.0.69/bin/apache-tomcat-7.0.69.tar.gz && \
	tar -xvf apache-tomcat-7.0.69.tar.gz -C /opt/  && \
	mv /opt/apache-tomcat-7.0.69 /opt/tomcat7 && \
	rm -rf apache-tomcat-7.0.69.tar.gz && \
	rm -rf /opt/tomcat7/webapps/* 

#add tomcat config
ADD conf/logging.properties /opt/tomcat7/conf/
ADD conf/server.xml /opt/tomcat7/conf/
ADD bin/catalina.sh /opt/tomcat7/bin/

ADD supervisor_tomcat.conf /etc/supervisor.conf.d/

expose 8080
