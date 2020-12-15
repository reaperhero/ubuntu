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

- 常用语句

```
创建只读账户
CREATE USER 'readuser_name'@'%' IDENTIFIED BY 'readuser_password';
GRANT SELECT ON *.* TO 'readuser_name'@'%';
FLUSH PRIVILEGES;
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