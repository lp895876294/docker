#
# MAINTAINER        glodonedu
# DOCKER-VERSION    1.11.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       registry.aliyuncs.com/glodonedu/centos:7.1
MAINTAINER lp


RUN yum install -y openssl-devel ncurses-devel && \
	wget http://erlang.org/download/otp_src_R15B01.tar.gz && \
	tar -xvf otp_src_R15B01.tar.gz && rm -rf otp_src_R15B01.tar.gz && \
	cd otp_src_R15B01 && \
	./configure --prefix=/usr/local/erlang --with-ssl --enable-threads --enable-smp-support --enable-kernel-poll --enable-hipe --without-javac && \
	make && make install && \
	rm -rf ../otp_src_R15B01

#erlang根目录
ENV ERL_HOME /usr/local/erlang
ENV PATH $PATH:$ERL_HOME/bin
