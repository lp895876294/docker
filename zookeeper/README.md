#基于docker的zookeeper配置
* zookeeper根目录为/opt/zookeeper-3.4.8。
* clientPort配置，默认为2181。可以通过环境变量ZOOKEEPER_PORT=2182配置。
* 集群配置。通过环境变量ZOOKEEPER_1=localhost:2888:3888 ， ZOOKEEPER_2=localhost:2887:3887配置。
* 集群SERVER_ID配置。通过指定环境变量SERVER_ID。
* 添加zoo.cfg到/opt/zookeeper-3.4.8/conf目录。其中zoo.cfg注销了clientPort；修改dataDir=/opt/zookeeper-3.4.8/data，即zookeeper根目录下的data文件夹。
* docker的网路运行模式最好配置为host，与宿主机共用网络和端口。否则zookeeper集群中节点IP地址不易获取。
* docker进程通过supervisor管理。docker的配置参数，通过在supervisor中运行initzk.sh配置；docker主进行执行bin/zkServer.sh start-foreground命令开启。
* testrun.sh，以host的网络模式运行一个zookeeper集群，其中包括3个zookeeper:3.4实例。

#参考配置
docker run -ti --net=host -e SERVER_ID=1 -e ZOOKEEPER_PORT=2181 -e ZOOKEEPER_1=localhost:2888:3888  registry.aliyuncs.com/glodonedu/zookeeper:3.4 
