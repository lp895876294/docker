#
# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       registry.aliyuncs.com/glodonedu/jdk:1.8
MAINTAINER lp

#add wrapper dir
ADD ./wrapper-delta-pack-3.5.14  /opt/wrapper-delta-pack-3.5.14

ADD supervisor_wrapper.conf /etc/supervisor.conf.d/

#wrapper home
ENV WRAPPER_HOME /opt/wrapper-delta-pack-3.5.14

