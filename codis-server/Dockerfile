#
# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       registry.aliyuncs.com/glodonedu/codis-config:3.0
MAINTAINER lp

#codis-server启动
ADD supervisor_codis.conf /etc/supervisor.conf.d/

EXPOSE 6379
