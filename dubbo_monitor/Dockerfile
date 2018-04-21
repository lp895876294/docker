#
# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       registry.aliyuncs.com/glodonedu/tomcat:7
MAINTAINER lp

#install jdk1.7
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.rpm && \
	rpm -ivh jdk-7u71-linux-x64.rpm && \
	rm -rf jdk-7u71-linux-x64.rpm

#删除jdk1.8，使用jdk1.7
RUN rm -rf /usr/local/jdk1.8.0_91 && ln -s /usr/java/jdk1.7.0_71 /usr/local/jdk1.8.0_91

ADD ./dubbo-monitor-simple-2.5.3-assembly.tar.gz /opt/

ENV MONITOR_HOME /opt/dubbo-monitor-simple-2.5.3

#multicast://224.5.6.7:1234
#使用环境变量的形式替换dubbo.properties中的固定值
RUN sed -i 's/multicast:\/\/224\.5\.6\.7:1234/${REGISTRY_ADDRESS}/g' $MONITOR_HOME/conf/dubbo.properties 

#设置默认值
ENV REGISTRY_ADDRESS zookeeper://127.0.0.1:2181
