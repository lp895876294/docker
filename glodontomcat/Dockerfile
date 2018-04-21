#
# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       registry.aliyuncs.com/glodonedu/tomcat:7
MAINTAINER lp

# install sshpass command   安装sshpass用于非交互的ssh操作
RUN yum install -y sshpass 

# is need sync      环境变量，是否需要同步静态资源
ENV START_SYNC 1

# local sync dir    本地需要同步的文件目录
ENV LOCAL_SYNC_DIR resources

# test environment  测试服务器密码
ENV TEST_HOST_PWD_1 www.zx.c0m

#product environment    生产节点密码，nginx静态资源目录在各项目的dockerfileh中设置
ENV PRODUCT_HOST_PWD_1 www.glodon.c0m.CN
ENV PRODUCT_HOST_PWD_2 www.glodon.c0m.CN

# add sync script       拷贝资源同步脚本
ADD sync_resources.sh /opt/

# add sync service      拷贝进程控制配置文件，supervisor在centos镜像中已安装
ADD supervisor_sync_resources.conf /etc/supervisor.conf.d/

# add ci service , 后缀名字是off，默认是关闭监控，如果需要打开，则执行docker exec移除后缀off
ADD supervisor_ci.conf /etc/supervisor.conf.d/supervisor_ci.conf.off

ENV AGENT_VERSION 1:4.7.2

# Install the Agent     安装oneapm性能监控
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


#add Docker check   docker监控配置文件
COPY conf.d/docker_daemon.yaml /etc/cloudinsight-agent/conf.d/docker_daemon.yaml

#set StatsD port
EXPOSE 8251/udp

#add functions      拷贝oneapm性能监控所需文件
COPY ./functions /etc/init.d/

#install sysstat    升级systemd使用sysstat
RUN yum remove -y systemd && yum install -y sysstat

#sync time          因监控需要显示服务器时间，添加同步时间脚本
RUN yum install -y ntpdate
ADD ./sync_time.sh /opt/
ADD supervisor_sync_time.conf /etc/supervisor.conf.d/


#set license        oneapm所需key
ENV LICENSE_KEY WgECAwQFAFVc651SHBIYH0sZGw624c1DWV0aAARSUd082h0IChhTChtR5a37BwQHGwIMTlQF
RUN sed -i -e "s/^.*license_key:.*$/license_key: ${LICENSE_KEY}/" /etc/cloudinsight-agent/cloudinsight-agent.conf

#add tomcat check   tomcat监控配置文件
COPY conf.d/tomcat.yaml /etc/cloudinsight-agent/conf.d/tomcat.yaml

#tomcat config      tomcat结合oneapm监控配置
#ENV CATALINA_OPTS "$CATALINA_OPTS -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=6901 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"

#tomcat性能调优
#ENV CATALINA_OPTS "$CATALINA_OPTS -server -Xms1g -Xmx1g -Xmn128m -XX:-DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:+UseCMSInitiatingOccupancyOnly "

#解决中文显示乱码问题
ENV LANG en_US.UTF-8

#开启监控，如果需要开启监控，在docker容器运行后直接运行如下命令
#docker exec cloudinsight-agent mv /etc/supervisor.conf.d/supervisor_ci.conf.off /etc/supervisor.conf.d/supervisor_ci.conf

#在jre中加入微软雅黑字体
ADD ./fonts $JAVA_HOME/jre/lib/fonts

ADD tomcatconf/server.xml /opt/tomcat7/conf/

#jmx lib
ADD tomcatlib/catalina-jmx-remote.jar /opt/tomcat7/lib/

#tomcat bin
ADD tomcatbin/catalina.sh /opt/tomcat7/bin/

#enable jmx function ; --net=host  -e ownerip=hostip
