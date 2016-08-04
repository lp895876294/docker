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
ENV LOCAL_SYNC_DIR resources

# test environment 
ENV TEST_HOST_PWD_1 www.zx.c0m

#product environment
ENV PRODUCT_HOST_PWD_1 www.zx.c0m
ENV PRODUCT_HOST_PWD_2 www.zx.c0m

# add sync script
ADD sync_resources.sh /opt/

# add sync service
ADD supervisor_sync_resources.conf /etc/supervisor.conf.d/


