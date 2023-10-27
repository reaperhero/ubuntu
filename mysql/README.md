# mysql

## 函数
- 常用函数

```
substring_index( address, ':', 1 )  # 根据:分隔，截取第一个字段
```


- 常用配置

```
sql-mode="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION";
```


- 连接数

```
show variables like '%max_connection%'; 查看最大连接数
set global max_connections=1000;        重新设置最大连接数  or 在/etc/my.cnf [mysqld] max_connections = 1000
show full processlist;                  当前连接数
```

## 索引

- 分类
在MySQL中，索引分为两大类：聚簇索引和非聚簇索引，对应B-Tree索引，Hash索引。聚簇索引是按照数据存放的物理位置为顺序的，而非聚簇索引则不同；聚簇索引能够提高多行检索的速度，而非聚簇索引则对单行的检索速度很快。

在这两大类的索引类型下，还可以将索引分成四个小类：

1，普通索引：最基本的索引，没有任何限制，是我们大多数情况下使用到的索引。

2，唯一索引：与普通索引类型，不同的是唯一索引的列值必须唯一，但允许为空值。

3，全文索引：全文索引（FULLTEXT）仅可以适用于MyISAM引擎的数据表；作用于CHAR、VARCHAR、TEXT数据类型的列。

4，组合索引：将几个列作为一条索引进行检索，使用最左匹配原则。


> 使用场景
值的差异性大，并且以等值查找（=、 <、>、in）为主，Hash索引是更高效的选择，它有O(1)的查找复杂度
值的差异性相对较差，并且以范围查找为主，B树是更好的选择，它支持范围查找。



## 数据库默认值

|类型|	字节	|格式	|用途	|是否支持设置系统默认值|
|---|---|---|----|---|
|date|	3|	YYYY-MM-DD	|日期值	|不支持|
|time|	3|	HH:MM:SS	|时间值或持续时间	|不支持|
|year|	1|	|YYYY	|年份	|不支持|
|datetime|	8|	YYYY-MM-DD HH:MM:SS	|日期和时间混合值	|不支持|
|timestamp|	4|	YYYYMMDD HHMMSS	|混合日期和时间，可作时间戳	|支持|

```
整形，我们一般使用0作为默认值
字符串，默认空字符串
时间，可以默认1970-01-01 08:00:01


`default_time_field` TIMESTAMP NOT NULL DEFAULT '1970-01-01 08:00:01'    // '0001-01-01 00:00:00'
`default_time_field` DATETIME DEFAULT CURRENT_TIMESTAMP                  // 5.6.5及之后的版本中，可以使用CURRENT_TIMESTAMP作为datetime类型列的默认值

```



## 锁

悲观锁方案：每次获取商品时，对该商品加排他锁。也就是在用户A获取获取 id=1 的商品信息时对该行记录加锁，期间其他用户阻塞等待访问该记录。悲观锁适合写入频繁的场景。
```
begin;

select * from goods where id = 1 for update;

update goods set stock = stock - 1 where id = 1;

commit;
```
乐观锁方案：每次获取商品时，不对该商品加锁。在更新数据的时候需要比较程序中的库存量与数据库中的库存量是否相等，如果相等则进行更新，反之程序重新获取库存量，再次进行比较，直到两个库存量的数值相等才进行数据更新。乐观锁适合读取频繁的场景。
```
select * from goods where id = 1

begin;

update goods set stock = stock - 1 where id = 1 and stock = cur_stock;

commit;
```
