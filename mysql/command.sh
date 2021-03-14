#!/bin/bash


```
alter table seonoco_user AUTO_INCREMENT=1000;   # 修改主键自增id
SET SQL_SAFE_UPDATES = 0;     # 可以更新字段
```
      

```
show columns from table_name from database_name; -- 显示表中列名称。
show grants for user_name; -- 显示一个用户的权限，显示结果类似于grant 命令。
show index from table_name; -- 显示表的索引。
show status; -- 显示一些系统特定资源的信息，例如，正在运行的线程数量。
show variables; -- 显示系统变量的名称和值。
show processlist; -- 显示系统中正在运行的所有进程，大多数用户可以查看他们自己的进程，但是如果他们拥有process权限，就可以查看所有人的进程，包括密码。
show table status; -- 显示当前使用或者指定的database中的每个表的信息。信息包括表类型和表的最新更新时间。
show privileges; -- 显示服务器所支持的不同权限。
show create database database_name; -- 显示create database 语句是否能够创建指定的数据库。
show create table table_name; -- 显示create database 语句是否能够创建指定的数据库。
show engies; -- 显示安装以后可用的存储引擎和默认引擎。
show innodb status; -- 显示innoDB存储引擎的状态。
show logs; -- 显示BDB存储引擎的日志。
show warnings; -- 显示最后一个执行的语句所产生的错误、警告和通知。
show errors; -- 只显示最后一个执行语句所产生的错误。
show [storage] engines; --显示安装后的可用存储引擎和默认引擎
show binary logs; --获取binlog文件名列表


SHOW CHARACTER SET; 显示所有可用的字符集
SHOW COLLATION; 输出包括所有可用的字符集
SHOW ENGINE; 显示存储引擎的日志或状态信息。目前只支持：SHOW ENGINE BDB LOGS; SHOW ENGINE INNODB STATUS;
SHOW GRANTS; 查看相关权限
SHOW INDEX FROM table_name;会返回表索引信息。
SHOW OPEN TABLES; 列举在表缓存中当前被打开的非TEMPORARY表。
SHOW TRIGGERS; 列出了目前被MySQL服务器定义的触发程序
show binary logs;
```

- 修改密码

MySQL 5.7.6版本以下
```
USE mysql;

UPDATE user 
SET authentication_string = PASSWORD('newpasswd')
WHERE user = 'dbadmin' AND 
      host = 'localhost';

FLUSH PRIVILEGES;
```

MySQL 5.7.6+版本以上
```
USE mysql;

UPDATE user 
SET authentication_string = PASSWORD('newpasswd')
WHERE user = 'dbadmin' AND 
      host = 'localhost';

FLUSH PRIVILEGES;
```


