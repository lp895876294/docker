#codis
* 编译之后的codis，包括codis-proxy、codis-config、codis-server。
* codis-proxy和codis-config默认的配置为config.ini；codis-server默认的配置为redis.conf。
* config.ini和redis.conf所在的容器目录为/codis/conf。在run容器时可以通过-v指定配置。
