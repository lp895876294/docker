# rabbitmq的配置
* 修改了ebin/rabbit.app中的loopback_users，删除<<"guest">>，所有机器可以通过访问rabbitmq的web管理页面。
* 问题：rabbitmq能够正常启动，能够创建exchange和queue，但是不接受连接。查看日志后发现是rabbitmq的默认最高只占用40%的内存，通过修改最大内存的占用量解决问题。[参考文档](http://www.rabbitmq.com/memory.html)
* rabbitmq集群配置。使用docker运行rabbitmq集群的配置比是实体机上配置要灵活。<br>
   运行docker，参数：--hostname=rabbitname --add-host otherrabbitname:ip 。rabbitmq集群中节点必须指定hostname，否则节点无法加入集群<br>
   rabbitmq的docker镜像基于erlang的docker镜像构建，所以.erlang.cookie文件的值都相同，erlang集群节点可以直接通信。<br>
   使用rabbitmq-server -detached运行rabbitmq。<br>
* [rabbitmq集群参考](http://www.rabbitmq.com/clustering.html) 
* [rabbitmq HA参考](http://www.rabbitmq.com/pacemaker.html) , [参考2](http://88250.b3log.org/rabbitmq-clustering-ha) , [参考3](http://blog.csdn.net/linxuping/article/details/46543841) 
* [rabbitmq环境变量参考](http://www.rabbitmq.com/configure.html#define-environment-variables)



