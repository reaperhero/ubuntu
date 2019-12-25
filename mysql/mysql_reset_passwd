1、在mysqld参数重添加skip-grant-tables
2、systemctl restart mariadb.service
3、空密码登入 mysql -u root
4、update mysql.user set password=PASSWORD('newpassword') where User='root';
5、flush privileges
6、取消skip-grant-tables参数，重新启动mysql，并登入开始做授权
7、GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;