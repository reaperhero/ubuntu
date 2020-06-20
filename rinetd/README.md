# apt-get install rinetd

[bindaddress] [bindport] [connectaddress] [connectport]
绑定的地址    绑定的端口  连接的地址      连接的端口

[Source Address] [Source Port] [Destination Address] [Destination Port]
源地址            源端口         目的地址               目的端口



0.0.0.0 8080 172.19.94.3 8080
0.0.0.0 2222 192.168.0.103 3389
1.2.3.4 80 192.168.0.10 80
allow *.*.*.*
logfile /var/log/rinetd.log


0.0.0.0表示本机绑定所有可用地址
将所有发往本机8080端口的请求转发到172.19.94.3的8080端口
将所有发往本机2222端口的请求转发到192.168.0.103的3389端口
将所有发往1.2.3.4的80端口请求转发到192.168.0.10的80端口
allow设置允许访问的ip地址信息,*.*.*.*表示所有IP地址
logfil设置打印的log的位置