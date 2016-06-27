#!/bin/bash

#rabbitmq data directory is "/var/lib/rabbitmq"
docker run -ti --net=host -v /docker/rabbitmqdata:/var/lib/rabbitmq registry.aliyuncs.com/glodonedu/rabbitmq:3.5
