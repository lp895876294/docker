#!/bin/bash
if [ "$CLUSTER_NODE" == "" ] ; then
	echo "not join cluster"
else
	echo "join rabbitmq cluster $CLUSTER_NODE" 
	$RABBITMQ_HOME/sbin/rabbitmqctl stop_app && \ 
	$RABBITMQ_HOME/sbin/rabbitmqctl join_cluster $CLUSTER_NODE && \ 
	$RABBITMQ_HOME/sbin/rabbitmqctl start_app  
fi

