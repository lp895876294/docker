docker stop cloudinsight-agent

docker rm cloudinsight-agent

docker run -dti --name cloudinsight-agent -h hello2 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /proc/:/host/proc/:ro \
	-v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
	-e LICENSE_KEY={your_license_key_here} \
	registry.aliyuncs.com/glodonedu/alitomcat:1.1
