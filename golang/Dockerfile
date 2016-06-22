#
# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       registry.aliyuncs.com/glodonedu/centos:7.1
MAINTAINER lp


RUN wget https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz && \
	tar -xvf go1.6.2.linux-amd64.tar.gz -C /usr/local && \
	rm -rf go1.6.2.linux-amd64.tar.gz && \
	mkdir -p /go
#GOLANG根目录
ENV GOROOT /usr/local/go
#GO应用目录
ENV GOPATH /go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin
