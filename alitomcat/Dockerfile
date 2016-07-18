#
# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       registry.aliyuncs.com/glodonedu/tomcat:7
MAINTAINER lp

# install sshpass command
RUN yum install -y sshpass 

# is need sync 
ENV START_SYNC 1

# local sync dir
ENV LOCAL_SYNC_DIR ${TOMCAT_HOME}/webapps/ROOT/resources

# test environment 
ENV TEST_HOST_PWD_1 www.zx.c0m
ENV TEST_HOST_DIR_1 root@10.126.8.77:/data/webresources

# add sync script
ADD sync_resources.sh /opt/

# add sync service
ADD supervisor_sync_resources.conf /etc/supervisor.conf.d/


