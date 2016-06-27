#!/bin/bash

#rabbitmq data directory is "/var/lib/rabbitmq"
docker run -ti --hostname=rabbit109 \
 --add-host rabbit105:172.16.230.105 \
 -p 15672:15672 -p 25672:25672 -p 5672:5672 -p 4369:4369 \
 registry.aliyuncs.com/glodonedu/rabbitmq:3.5
