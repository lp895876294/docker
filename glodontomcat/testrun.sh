docker stop cloudinsight-agent

docker rm cloudinsight-agent

docker run -dti --name cloudinsight-agent -h helloworld -p 8081:8080 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /proc/:/host/proc/:ro \
	-v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
	registry.aliyuncs.com/glodonedu/alitomcat:0.7

#开启监控
docker exec cloudinsight-agent mv /etc/supervisor.conf.d/supervisor_ci.conf.off /etc/supervisor.conf.d/supervisor_ci.conf

