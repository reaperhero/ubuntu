


- 常用语句

```
创建只读账户
CREATE USER 'readuser_name'@'%' IDENTIFIED BY 'readuser_password';
GRANT SELECT ON *.* TO 'readuser_name'@'%';
FLUSH PRIVILEGES;

批量替换
update 表名 set 字段1 = replace(字段1,'c','C'); 


查询用户权限
select * from mysql.user;
```


- update

```
UPDATE artikel 
SET 
    amount = CASE
        WHEN amount - minimuminventory - 2 < 0 THEN amount = amount - 2
        ELSE amount = 99
    END
WHERE
    artnr = 17;
```

- 重置密码

```
1、在mysqld参数重添加skip-grant-tables
2、systemctl restart mariadb.service
3、空密码登入 mysql -u root
4、update mysql.user set password=PASSWORD('newpassword') where User='root';
5、flush privileges
6、取消skip-grant-tables参数，重新启动mysql，并登入开始做授权
7、GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;
```