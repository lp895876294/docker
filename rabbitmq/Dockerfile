#
# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       registry.aliyuncs.com/glodonedu/erlang:15
MAINTAINER lp


RUN yum install -y zip unzip xmlto && \
	wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.5.1/rabbitmq-server-3.5.1.tar.gz && \
	tar -xvf rabbitmq-server-3.5.1.tar.gz && rm -rf rabbitmq-server-3.5.1.tar.gz && \
	cd rabbitmq-server-3.5.1 && \
	make && make install TARGET_DIR=/opt/mq/rabbitmq SBIN_DIR=/opt/mq/rabbitmq/sbin MAN_DIR=/opt/mq/rabbitmq/man  && \
	rm -rf ../rabbitmq-server-3.5.1 && \
	mkdir -p /etc/rabbitmq && \
	/opt/mq/rabbitmq/sbin/rabbitmq-plugins enable rabbitmq_management 

RUN sed -i 's/{loopback_users,\[\(<<"guest">>]\)}/{loopback_users,[]}/g' /opt/mq/rabbitmq/ebin/rabbit.app

#add supervisor
ADD supervisor_rabbitmq.conf /etc/supervisor.conf.d/
ADD joinCluster.sh /opt/mq/
ADD startDetached.sh /opt/mq/
#rabbitmq
expose 4369 5671 5672 15672 25672

#rabbitmq
ENV RABBITMQ_HOME /opt/mq/rabbitmq
ENV PATH $PATH:$RABBITMQ_HOME/sbin

