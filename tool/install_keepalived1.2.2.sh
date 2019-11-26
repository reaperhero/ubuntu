#!/bin/bash
yum install popt-devel openssl-devel -y
cd /tmp
wget http://www.keepalived.org/software/keepalived-1.2.2.tar.gz
tar xzf keepalived-1.2.2.tar.gz
cd keepalived-1.2.2
./configure
make && make install
cp /usr/local/etc/rc.d/init.d/keepalived /etc/init.d/
cp /usr/local/etc/sysconfig/keepalived /etc/sysconfig/
chmod +x /etc/init.d/keepalived
chkconfig --add keepalived
chkconfig keepalived on
mkdir /etc/keepalived
ln -s /usr/local/sbin/keepalived /usr/sbin/
echo "keepalived-1.2.2安装成功,启动的监听文件为/var/log/messages"
echo "service keepalived start | stop | status "
