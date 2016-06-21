#
# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       registry.aliyuncs.com/glodonedu/codis:3.0
MAINTAINER lp

#codis-server启动
ADD supervisor_codis-server.conf /etc/supervisor.conf.d/

EXPOSE 6379
