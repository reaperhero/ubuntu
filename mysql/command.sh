#!/bin/bash


```
CREATE DATABASE `ide`  DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;


alter table seonoco_user AUTO_INCREMENT=1000;   # 修改主键自增id
SET SQL_SAFE_UPDATES = 0;                       # 可以更新字段
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


```
select * from information_schema.processlist where Host like  '%192.168.10.10%'\G;
kill 209876
```

备份恢复
```
mysqldump -h 192.168.1.10 -uroot -p123456 -B finance rank > 1.sql  备份多个库
mysql -h 192.168.1.10 -P3306 -uroot -p123456 -e 'show databases;' 2>/dev/null|grep -E -v "Database|information_schema|mysql|performance_schema"
mysqldump -h 192.168.1.10 -uroot -p123456 -A >/backup/full.sql备份全库
mysql -h 192.168.1.10 -uroot -p123456 < full.sql   恢复

mysqldump -h 192.168.1.10 --opt -d internal_training -umix -p123456  --ignore-table=internal_training.admin_access --ignore-table=internal_training.admin_access_type --ignore-table=internal_training.phinxlog --ignore-table=internal_training.permission --ignore-table=internal_training.permission_group --ignore-table=internal_training.env_config --ignore-table=internal_training.env_config_type > init.sql 只导表结构
```

show open tables使用教程
```
show open tables from db_name; 过滤库
show open tables like '%table_name%';  过滤表

```

主机连接分组
```
SELECT substring_index(host, ':',1) AS host_name,state,count(*) FROM information_schema.processlist GROUP BY state,host_name;
```


单表备份恢复
```
mysqldump -h 192.168.1.10 -uroot -p123456 db_name table_name >table_name.sql
mysql -h 192.168.1.10 -uroot -p123456 db_name <table_name.sql
```

单表指定条件备份
```
SELECT COUNT(*) TABLES, table_schema FROM information_schema.TABLES  WHERE table_schema ='db_name';查询库下有多少表
```

指定数据库中的数据表大小
```
SELECT TABLE_NAME,DATA_LENGTH+INDEX_LENGTH,TABLE_ROWS,concat(round((DATA_LENGTH+INDEX_LENGTH)/1024/1024,2), 'MB') as data FROM information_schema.TABLES WHERE TABLE_SCHEMA='live_broadcast';
```

```
全库备份
mysqldump -h 127.0.0.1 -uroot -p'123456' -E --triggers -e --max_allowed_packet=16777216 --net_buffer_length=16384  --master-data=2 --single-transaction --all-databases --quick  | gzip > all_database_bak_471_`date +%Y-%m-%d_%H_%M_%S`.sql.gz

```

恢复

```
sed -n '/^-- Current Database: `db_name`/,/^-- Current Database: `/p' all_database_bak_471_2017-12-04_15_36_38.sql > db_log.sql # 从全备中过滤db_name库的sql
```





参数
```
key_buffer_size=32M   MyISAM表索引缓冲区的大小
query_cache_size  查询缓存大小,query_cache_type=ON才生效
tmp_table_size  临时表大小
innodb_buffer_pool_size  缓存innodb表的索引，数据，插入数据时的缓冲
max_connections 最大连接数
sort_buffer_size 会话首次分配缓冲大小
参数查询
SHOW VARIABLES LIKE '%innodb_lock_wait%';  锁等待超时时间
参数修改
SET GLOBAL innodb_lock_wait_timeout=50;


SET SQL_SAFE_UPDATES = 0;
```

- 慢日志

```
show variables like 'slow_query%';   
show variables like 'long_query_time';
show variables like 'slow_query_log_file';
show variables like '%log_output%';

set global log_output='TABLE';   or FILE

set global slow_query_log='ON';   // OFF
set global long_query_time=3;   // 要重连才能看见

SELECT start_time,
       user_host,
       query_time,
       lock_time,
       rows_sent,
       rows_examined,
       db,
       CONVERT(sql_text USING utf8)
FROM mysql.slow_log order by start_time desc

min_examined_row_limit = 0
```

MySQL5.7的锁等待超时的SQL是没有被记录在慢SQL日志中的(sql执行了，但是没执行成功)
MySQL8.0中，锁等待超时的SQL也会被记录在慢SQL记录中
低于min_examined_row_limit参数指定的值(扫描的行小于这个值，不记录)
query_time是累计了lock_time的

- sql日志

```
show variables like '%log_output%'; 
show variables like '%general_log%';

SET GLOBAL log_output = 'FILE';  
SET GLOBAL log_output = 'TABLE'; 

SET GLOBAL general_log = 'ON';   //日志开启
SET GLOBAL general_log = 'OFF';  //日志关闭

SELECT *,CONVERT(argument USING utf8) from mysql.general_log ORDER BY event_time DESC;  查看日志
tail -f /var/log/mariadb/mariadb.log
```

- 查看表注释

```
SELECT
table_name 表名,
table_comment 表说明
FROM
information_schema.TABLES
WHERE
table_schema = '数据库名'
ORDER BY
table_name
``` 
