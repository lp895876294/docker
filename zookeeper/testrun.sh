#!/bin/bash
docker run -tid --restart=always --net=host -p 2181:2181 -e SERVER_ID=1 -e ZOOKEEPER_PORT=2181 \
-e ZOOKEEPER_1=localhost:2887:3887 \
-e ZOOKEEPER_2=localhost:2888:3888 \
-e ZOOKEEPER_3=localhost:2889:3889 \
registry.aliyuncs.com/glodonedu/zookeeper:3.4 



docker run -tid --restart=always --net=host -p 2182:2182 -e SERVER_ID=2 -e ZOOKEEPER_PORT=2182 \
-e ZOOKEEPER_1=localhost:2887:3887 \
-e ZOOKEEPER_2=localhost:2888:3888 \
-e ZOOKEEPER_3=localhost:2889:3889 \
registry.aliyuncs.com/glodonedu/zookeeper:3.4 


docker run -tid --restart=always --net=host -p 2183:2183 -e SERVER_ID=3 -e ZOOKEEPER_PORT=2183 \
-e ZOOKEEPER_1=localhost:2887:3887 \
-e ZOOKEEPER_2=localhost:2888:3888 \
-e ZOOKEEPER_3=localhost:2889:3889 \
registry.aliyuncs.com/glodonedu/zookeeper:3.4 
