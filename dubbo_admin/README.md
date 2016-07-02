# dubbo管理员控制台
* dubbo的registry.address通过环境变量REGISTRY_ADDRESS指定，root密码通过环境变量ROOT_PASSWORD指定，guest密码通过环境变量GUEST_PASSWORD指定。
* REGISTRY_ADDRESS，ROOT_PASSWORD，GUEST_PASSWORD 和默认配置文件中值相同
* 运行命令参考： docker run -ti -p 8080:8080 -e REGISTRY_ADDRESS=172.16.230.109:2181 registry.aliyuncs.com/glodonedu/dubbo_admin:2.5
* 由于docker容器封装了dubbo-admin，对外暴漏的host ip是docker容器的地址，其它宿主机容器之间如果网络无法互联，则dubbo-admin无法监控到服务提供者，需要把基于docker的dubbo-admin部署与zookeeper一台宿主机上。 如果不同的宿主机之间的docker容器可以互联，dubbo_admin可以与zookeeper部署在不同的宿主机，[不同宿主机容器互联参考](http://lpyyn.iteye.com/blog/2308714) 
