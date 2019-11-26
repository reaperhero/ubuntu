
#!/bin/bash
echo "安装nginx-1.10.1"
echo "编译安装:/usr/local/nginx"
echo "开始安装............................"
yum install -y pcre pcre-devel
yum install -y zlib zlib-devel
yum install -y openssl openssl-devel
wget -c https://nginx.org/download/nginx-1.10.1.tar.gz
tar -zxvf nginx-1.10.1.tar.gz
cd nginx-1.10.1
mkdir /usr/local/nginx 
./configure --prefix=/usr/local/nginx 
make && make install
whereis nginx
cd /usr/local/nginx/sbin/
./nginx 
status_nginx=`ps aux|grep "master process"|wc -l`
ipaddr=`ifconfig | grep broadcast | awk "NR==1" | awk -F" " '{print $2}'`
if [ ${status_nginx} = 1 ]
then
  echo "nginx启动成功"
  echo "访问地址：http://${ipaddr}"
else
  echo "nginx启动失败"
fi 

echo "/usr/local/nginx/sbin/nginx" >> /etc/rc.local
chmod 755 /etc/rc.local
echo "已经设置开机自动启动"
echo "/usr/local/nginx/sbin/nginx -s [stop|start|reload]"
echo "安装结束............................"
