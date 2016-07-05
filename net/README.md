# docker网络管理，打通不同宿主机docker容器网络的方案包括：
* 基于隧道技术。weave、flannel、[openvswitch](http://lpyyn.iteye.com/blog/2308714)。[参考](http://blog.liuker.cn/index.php/docker/30.html)
* 路由方案。calico 、liunx路由转发。
# 以上这些方式每种方式都有自己的优缺点。在调研了这几种方案的配置和实现方式之后，还是计划结合我们本身生产环境使用liunx路由转发。
* 现在生产环境中网络是使用的VPC网络，网络中的服务ip地址同属于一个子网，并且IP地址是连续的。因此，可以为每台服务器指定docker容器地址的规则，然后在所有的服务中动态添加docker容器的路由规则。    
# 具体方式如下：
* 假如服务器ip地址为：10.126.8.64/26，在当前子网中能够创建62台服务器。
* 每台服务中的docker容器ip规则为：172.17.(宿主机ip2进制后8位).1/24，每台服务器可以同时运行254个具有网络的docker容器。需要绑定docker0网卡的ip地址生成规则。
* 为现有的所有服务器添加路由规则： route add -net 172.17.(宿主机ip2进制后8位).0/24 gw 10.126.8.(宿主机ip2进制后8位)。这样不同宿主机的docker容器之间就可以通过路由转发实现相互通信。
* 这种方式缺点：对于服务器ip地址规则不清晰的服务器地址，不可行。优点：配置简单，稳定性好。
* 优化方式：可以借助分布式服务协调中间件zookeeper，在每台服务器上开发一个agent，通过agent连接zookeeper，动态的添加和监控子网中的ip地址变化情况。

* 参考： [centos7开机启动脚本](http://www.asni.cn/1425)、[docker自定义子网掩码](http://wiki.jikexueyuan.com/project/docker-technology-and-combat/docker0.html)
