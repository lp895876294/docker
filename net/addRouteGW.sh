#!/bin/bash

#使用路由的方式实现不同宿主机的docker容器之间的通信

#docker ip default prefix
docker_prefixip=172.17

#local subnet ip
local_preip=172.16.230

#subnet start ip address , end ip address
local_startip=105
local_endip=109

#current host ip
localip=$(ifconfig eth0 | grep 'inet ' | sed 's|.*inet ||g' | sed 's|netmask.*||g')

for (( i=${local_startip} ; i <= ${local_endip} ; i=i+1 ))
do
	#remote host ip address
	host_remoteip=${local_preip}.${i} 
	
	#not add current host docker ip route
	if [ ${host_remoteip} == ${localip}  ]; then
		echo "localip ${localip}"
		continue 
	fi
	
	#docker ip netmask
	docker_remotenetmask=${docker_prefixip}.${i}.0/24

	#add route info
	route del -net ${docker_remotenetmask} gw ${host_remoteip}
	route add -net ${docker_remotenetmask} gw ${host_remoteip}
	
done

route 

