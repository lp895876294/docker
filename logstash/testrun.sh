#!/bin/bash
version=1.3

docker stop logstash

docker rm logstash

docker run -dti --name logstash \
-v /docker/rtf-dockerdata/dockerdata/logstash/conf/:/logstash/conf/  \
-v /docker/rtf-dockerdata/dockerdata/logstash/testrz.glodonedu.com_access.log:/logstash/logs/testrz.glodonedu.com_access.log \
registry.aliyuncs.com/glodonedu/logstash:${version}

