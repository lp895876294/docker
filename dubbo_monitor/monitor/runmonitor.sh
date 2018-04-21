#!/bin/bash
version=2.5.1

imagename=dubbo_monitor

# port prefix
portnum=898

runnum=1

# run 
for (( i=1 ; i<=${runnum}; i++ ))
do
	#container name
    containername="${imagename}${i}"
	
	# handle old container
	docker stop ${containername}
	docker rm ${containername}

	port="${portnum}${i}"

	# restart
	docker run -tdi --restart=always --name=${containername} --net=host \
        -v /docker/rtf-dockerdata/dockerdata/dubbo_monitor/monitor/dubbo.properties:/opt/dubbo-monitor-simple-2.5.3/conf/dubbo.properties \
		registry.aliyuncs.com/glodonedu/${imagename}:${version}

done

