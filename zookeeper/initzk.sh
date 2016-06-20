#!/bin/bash
#set zookeeper root path
basepath=${ZOOKEEPER_HOME}

#server id
mkdir -p "${basepath}/data"
echo "${SERVER_ID}" > "${basepath}/data/myid"

#put server.* to zoo.cfg
if [ ! -f "${basepath}/_inited" ] ; then

echo "init zookeeper config "

touch "${basepath}/_inited"


zkclientport="${ZOOKEEPER_PORT}"

# get zk client port,default is 2181
if [ "$zkclientport" == "" ] ; then
	zkclientport="2181"
fi

echo "clientPort="$zkclientport >> "${basepath}/conf/zoo.cfg"

#config zoo.cfg
for (( i=1 ; i<=20 ; i=i+1 ))
do

	clusterserver="ZOOKEEPER_${i}"
	# get env ZOOKEEPER_* value
	eval clusterserver=\$$clusterserver
	
	if [ "$clusterserver" != "" ] ; then
		echo "server.${i}="$clusterserver >> "${basepath}/conf/zoo.cfg"
	fi


done

fi

