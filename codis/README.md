#codis
* 编译之后的codis，包括codis-proxy、codis-config、codis-server。
* codis-proxy和codis-config默认的配置为config.ini；codis-server默认的配置为redis.conf。
* config.ini和redis.conf所在的容器目录为/codis/conf。在run容器时可以通过-v指定配置。
* 只是将codis编译好了，具体运行方式还需要手动运行。以后再进行改进。
* 启动dashboard : /codis/bin/startDashboard.sh
* 初始化slot : /codis/bin/startSlotinit.sh
* 创建proxy : /codis/bin/startProxy.sh , proxy需要在添加完codis-server并设置完slot-range之后设置。
