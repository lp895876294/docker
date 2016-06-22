# Docker 构建实例
使用supervisor管理docker容器启动时运行的进程。

* bin : 帮助构建和发布容器的docker命令脚本，registry使用的是阿里容器中心（registry.aliyuncs.com）
* centos7 : 添加了常用的工具，主要包括gcc、python和supervisor，同时初始化了supervisor的配置
* jdk8 : jdk1.8-x64安装和配置
* tomcat7 : 安装tomcat，优化了tomcat访问日志。具体参考tomcat7/README.md
* zookeeper : 安装zookeeper3.4.8，支持单点和集群的zookeeper配置，具体参考zookeeper/README.md
* golang : 基于go1.6构建
* mysql : 暂未使用
* codis : 暂未使用
* codis-server : 暂未使用
