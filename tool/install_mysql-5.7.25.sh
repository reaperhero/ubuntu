#!/bin/bash
echo "==========================下载安装mysql5.7======================="
yum -y install yum-utils
rpm -Uvh https://repo.mysql.com//mysql80-community-release-el7-2.noarch.rpm
yum repolist all | grep mysql
yum-config-manager --disable mysql80-community
yum-config-manager --enable mysql57-community
yum repolist enabled | grep mysql
yum install mysql-community-server -y
echo "===================启动mysql5.7=========================="
systemctl start  mysql
systemctl enable  mysql
grep 'temporary password' /var/log/mysqld.log
echo "===================登入注意事项=========================="
echo  -e "登入mysql \nset global validate_password_policy=0;\nset global validate_password_length=1;\nalter user 'root'@'localhost' identified by '123456';"


#wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
#rpm -ivh mysql-community-release-el7-5.noarch.rpm
#yum install mysql-server -y
#systemctl enable  mysql
#systemctl start  mysql 
