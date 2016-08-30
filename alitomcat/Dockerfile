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

# add ci service , 后缀名字是off，默认是关闭监控，如果需要打开，则执行docker exec移除后缀off
ADD supervisor_ci.conf /etc/supervisor.conf.d/supervisor_ci.conf.off

ENV AGENT_VERSION 1:4.7.0-1

# Install the Agent
RUN echo -e '[cloudinsight-agent]\nname = OneAPM, Inc.\nbaseurl = http://yum.oneapm.com/x86_64/\nenabled=1\ngpgcheck=0\npriority=1' \
	> /etc/yum.repos.d/cloudinsight-agent.repo && \
	yum -y install initscripts; yum clean all && \
	yum -y --disablerepo='*' --enablerepo='cloudinsight-agent' install cloudinsight-agent; yum clean all

# Configure the Agent
# 1. Turn syslog off
# 2. Remove cloudinsight-agent user from supervisor configuration
# 3. Remove cloudinsight-agent user from init.d configuration
# 4. Fix permission on /etc/init.d/cloudinsight-agent
# 5. Remove network check
RUN mv /etc/cloudinsight-agent/cloudinsight-agent.conf.example /etc/cloudinsight-agent/cloudinsight-agent.conf && \
	sed -i -e"s/^.*log_to_syslog:.*$/log_to_syslog: no/" /etc/cloudinsight-agent/cloudinsight-agent.conf && \
	sed -i "/user=cloudinsight-agent/d" /etc/cloudinsight-agent/supervisord.conf && \
	sed -i 's/AGENTUSER="cloudinsight-agent"/AGENTUSER="root"/g' /etc/init.d/cloudinsight-agent && \
	chmod +x /etc/init.d/cloudinsight-agent && \
	rm /etc/cloudinsight-agent/conf.d/network.yaml.default


#add Docker check
COPY conf.d/docker_daemon.yaml /etc/cloudinsight-agent/conf.d/docker_daemon.yaml

#set StatsD port
EXPOSE 8251/udp

#add functions
COPY ./functions /etc/init.d/

#install sysstat
RUN yum remove -y systemd && yum install -y sysstat

#sync time
RUN yum install -y ntpdate
ADD sync_time.sh /opt/
ADD supervisor_sync_time.conf /etc/supervisor.conf.d/


#set license
ENV LICENSE_KEY your_oneapm_key
RUN sed -i -e "s/^.*license_key:.*$/license_key: ${LICENSE_KEY}/" /etc/cloudinsight-agent/cloudinsight-agent.conf

#add tomcat check
COPY conf.d/tomcat.yaml /etc/cloudinsight-agent/conf.d/tomcat.yaml

ADD ./ROOT.war /opt/tomcat7/webapps

#tomcat config
ENV CATALINA_OPTS "$CATALINA_OPTS -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=6901  -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"

#开启监控，如果需要开启监控，在docker容器运行后直接运行如下命令
#docker exec cloudinsight-agent mv /etc/supervisor.conf.d/supervisor_ci.conf.off /etc/supervisor.conf.d/supervisor_ci.conf


