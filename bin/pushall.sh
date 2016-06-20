#!/bin/bash

#container prefix 
csprefix="registry.aliyuncs.com/glodonedu/" 
#cs name
declare -a cs=("centos:7.1"  "jdk:1.8" "tomcat:7" "zookeeper:3.4")


for ((i=0; i<${#cs[*]}; i++))
do
        docker push "${csprefix}${cs[$i]}" 
done

echo 'push done'
