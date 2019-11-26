#!/bin/bash
echo "==========https://www.cnblogs.com/qiuyuesu/p/8404243.html=========="
echo "=======================上传mysql-5.6.43.tar.gz包=========="
useradd mysql
echo "mysql" | passwd mysql --stdin > /dev/null 2>&1
mkdir /usr/local/mysql
chown -R mysql:mysql /usr/local/mysql
yum -y install autoconf make gcc-c++ cmake bison-devel  ncurses-devel
tar xvf mysql-5.6.43.tar.gz
cd mysql-5.6.43
cmake . -DCMAKE_INSTALL_PREFIX=/usr/local/mysql -DMYSQL_DATADIR=/usr/local/mysql/data -DSYSCONFDIR=/etc -DWITH_MYISAM_STORAGE_ENGINE=1 -DWITH_INNOBASE_STORAGE_ENGINE=1 -DWITH_MEMORY_STORAGE_ENGINE=1 -DWITH_READLINE=1 -DMYSQL_UNIX_ADDR=/var/lib/mysql/mysql.sock -DMYSQL_TCP_PORT=3306 -DENABLED_LOCAL_INFILE=1 -DWITH_PARTITION_STORAGE_ENGINE=1 -DEXTRA_CHARSETS=all -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci
make && make install 
mkdir /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql
cd /usr/local/mysql
scripts/mysql_install_db --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data --user=mysql
cd /usr/local/mysql/support-files  && \cp mysql.server /etc/rc.d/init.d/mysql && \cp my-default.cnf /etc/my.cnf
chkconfig mysql on
service mysql start
ln -s /usr/local/mysql/bin/mysql /usr/bin/mysql
echo "mysql安装的目录为/usr/local/mysql，数据库初始化文件目录为/usr/local/mysql/data,并使用service mysql start|stop管理数据库"
echo "初次登入不需要密码"
