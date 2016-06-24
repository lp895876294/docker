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
	mkdir -p conf && ln -s $GOPATH/src/github.com/CodisLabs/codis /codis && \
	rm -rf /codis/config.ini 

#add codis conf
ADD conf/redis.conf /codis/conf/redis.conf
ADD conf/config.ini /codis/conf/config.ini

#codis comman
ADD startDashboard.sh /codis/bin/
ADD startSlotinit.sh /codis/bin/
ADD startProxy.sh /codis/bin/
