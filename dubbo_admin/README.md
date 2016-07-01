# dubbo管理员控制台
* dubbo的registry.address通过环境变量REGISTRY_ADDRESS指定，root密码通过环境变量ROOT_PASSWORD指定，guest密码通过环境变量GUEST_PASSWORD指定。
* REGISTRY_ADDRESS，ROOT_PASSWORD，GUEST_PASSWORD 和默认配置文件中值相同
* 运行命令参考： docker run -ti -p 8080:8080 -e REGISTRY_ADDRESS=172.16.230.109:2181 registry.aliyuncs.com/glodonedu/dubbo_admin:2.5
* 由于docker容器封装了dubbo-admin，对外暴漏的hostip是docker容器的地址，其它宿主机无法访问容器中的dubbo-admin。因此，需要把基于docker的dubbo-admin部署与zookeeper一台宿主机上。
