#
# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       registry.aliyuncs.com/glodonedu/golang:1.6
MAINTAINER lp


RUN go get -u -d github.com/CodisLabs/codis ; cd $GOPATH/src/github.com/CodisLabs/codis && \
	make && \
	mkdir -p conf && ln -s $GOPATH/src/github.com/CodisLabs/codis /codis 

#codis相关环境变量
ENV CODIS_HOME $GOPATH/src/github.com/CodisLabs/codis
ENV PATH $PATH:$CODIS_HOME/bin 

#supervisor
#ADD supervisor_codis.conf /etc/supervisor.conf.d/

#add codis conf
ADD conf/redis.conf /codis/conf/redis.conf
ADD conf/config.ini /codis/conf/config.ini
