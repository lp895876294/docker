# Docker 构建实例
使用supervisor管理docker容器启动时运行的进程。

* bin : 帮助构建和发布容器的docker命令脚本，registry使用的是[阿里容器中心](registry.aliyuncs.com)
* centos7 : 添加了常用的工具，主要包括gcc、python和supervisor，同时初始化了supervisor的配置
* jdk8 : jdk1.8-x64安装和配置
* tomcat7 : 安装tomcat，优化了tomcat访问日志。具体参考tomcat7/README.md
* zookeeper : 安装zookeeper3.4.8，支持单点和集群的zookeeper配置，具体参考[zookeeper配置](https://github.com/lp895876294/docker/tree/master/zookeeper)。
* golang : 基于go1.6构建。
* codis : 包含codis-config、codis-proxy等功能，需要根据实际环境启动和配置，最好以--net=host模式运行容器。
* codis-server : 类似于redis的服务端，比原有的redis增加了slot功能，默认暴露的端口为6379。
* erlang : 基于erlang_R15B01构建，[下载地址](https://www.erlang.org/downloads)。
* rabbitmq : 基于3.5.1构建，[下载地址](http://www.rabbitmq.com/releases/rabbitmq-server/) , [rabbitmq概览](http://www.rabbitmq.com/getstarted.html)，[rabbitmq文档](http://www.rabbitmq.com/documentation.html) 。
* dubbo_admin: dubbo管理端控制台。
* net : 实现docker容器网络互联的方案。以后结合zookeeper在每台宿主机上实现docker容器路由规则动态添加。
* mysql : 暂未使用
