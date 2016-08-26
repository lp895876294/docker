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

# add ci service
ADD supervisor_ci.conf /etc/supervisor.conf.d/

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

#set license
ENV LICENSE_KEY DwJXVQBUBQI87edLHhwbSUhLFF0a55ZCCQgcUwUEB2261B8GCU5QVRQKcba8BlRSHVECGAED
RUN sed -i -e "s/^.*license_key:.*$/license_key: ${LICENSE_KEY}/" /etc/cloudinsight-agent/cloudinsight-agent.conf

#add functions
COPY ./functions /etc/init.d/

#install sysstat
RUN yum remove -y systemd && yum install -y sysstat

#sync time
RUN yum install -y ntpdate
ADD sync_time.sh /opt/
ADD supervisor_sync_time.conf /etc/supervisor.conf.d/
