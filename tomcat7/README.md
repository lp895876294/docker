#主要内容
* 禁用tomcat access log , 注释了conf/server.xml中的访问日志，访问日志在nginx统一做。
``` xml
<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
               prefix="localhost_access_log." suffix=".txt"
               pattern="%h %l %u %t &quot;%r&quot; %s %b" />
```
* tomcat的以catalina、localhost、manager、host-manager开头的日志统一记录到catalina日志中。</br>
修改conf/logging.properties文件。

#参考文档
* [tomcat调优](http://www.cnblogs.com/gentoo/archive/2012/10/13/2722463.html)
* [tomcat文档](http://tomcat.apache.org/tomcat-7.0-doc/config/http.html)
* [jconsole](https://tomcat.apache.org/tomcat-7.0-doc/config/listeners.html)
* 没有加入gzip压缩，由nginx统一进行gzip压缩。 

