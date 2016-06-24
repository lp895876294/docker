# rabbitmq的配置
* 修改了ebin/rabbit.app中的loopback_users，删除<<"guest">>，所有机器可以通过访问rabbitmq的web管理页面。
* 问题：rabbitmq能够正常启动，能够创建exchange和queue，但是不接受连接。查看日志后发现是rabbitmq的默认最高只占用40%的内存，通过修改最大内存的占用量解决问题。[参考文档](http://www.rabbitmq.com/memory.html)
