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

#install dubbo-admin
RUN wget http://o9ko4774t.bkt.clouddn.com/dubbo-admin-2.5.4.war && \
	mv dubbo-admin-2.5.4.war ROOT.war && \ 
	unzip ROOT.war -d /opt/tomcat7/webapps/ROOT && \
	rm -rf ROOT.war

#使用环境变量的形式替换dubbo.properties中的固定值
RUN sed -i 's/zookeeper:\/\/127\.0\.0\.1:2181/${REGISTRY_ADDRESS}/g' $TOMCAT_HOME/webapps/ROOT/WEB-INF/dubbo.properties && \ 
    sed -i 's/=root/=${ROOT_PASSWORD}/g' $TOMCAT_HOME/webapps/ROOT/WEB-INF/dubbo.properties && \ 
    sed -i 's/=guest/=${GUEST_PASSWORD}/g' $TOMCAT_HOME/webapps/ROOT/WEB-INF/dubbo.properties

#设置默认值
ENV REGISTRY_ADDRESS zookeeper://127.0.0.1:2181
ENV ROOT_PASSWORD root
ENV GUEST_PASSWORD guest


