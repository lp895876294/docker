##实现使用后台进程的方式同步静态资源
* 使用非交互式的[sshpass](http://blog.csdn.net/zj0910/article/details/40679301)命令，在命令中指定远程主机的密码，然后使用scp命令远程拷贝或覆盖资源文件
* 使用环境变量app_profile指定应用运行的环境。
* 使用环境变量LOCAL_SYNC_DIR指定在本地环境中需要同步的目录
* 使用环境变量${app_profile}_HOST_PWD 和${app_profile}_HOST_DIR分别指定远程主机密码和路径，其中${app_profile}_HOST_DIR规则为username@remoteip:dir
* 可以指定不超过20个的${app_profile}_HOST_PWD_$i 和 ${app_profile}_HOST_DIR_$i，其中i的值为1~20 
