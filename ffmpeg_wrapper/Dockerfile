#
# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       registry.aliyuncs.com/glodonedu/ffmpeg_tomcat:7.1
MAINTAINER lp

# wrapper dir 
ADD ./wrapper-delta-pack-3.5.14  /opt/wrapper

ADD supervisor_wrapper.conf /etc/supervisor.conf.d/

#wrapper home
ENV WRAPPER_HOME /opt/wrapper

#wrapper main class
ENV WRAPPER_MAIN_CLASS com.project.MyDemo


