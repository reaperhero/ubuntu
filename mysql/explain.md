https://zhuanlan.zhihu.com/p/341595489


# 字段说明
- select_type
表示SELECT的类型，常见的取值有：

```
类型	      说明
SIMPLE	     简单表，不使用表连接或子查询
PRIMARY	     主查询，即外层的查询
UNION	     UNION中的第二个或者后面的查询语句
SUBQUERY	 子查询中的第一个
UNION RESULT 代表从union的临时表中读取数据
DERIVED      在SQL语句中包含在from子句中的子查询
```

- partitions
表示SQL语句查询时匹配到的分区信息，对于非分区表值为NULL，当查询的是分区表则会显示分区表命中的分区情况。

- table
输出结果集的表（表别名）


- type

表示MySQL在表中找到所需行的方式，或者叫访问类型。常见访问类型如下，从上到下，性能由差到最好

```
ALL	             全表扫描
index	         索引全扫描
range	         索引范围扫描
ref	             非唯一索引扫描
eq_ref	         唯一索引扫描
const,system     单表最多有一个匹配行
NULL	         不用扫描表或索引
```


- possible_keys
表示查询可能使用的索引

- key
实际使用的索引

- key_len
使用索引字段的长度

- ref
使用哪个列或常数与key一起从表中选择行。

- rows
扫描行的数量

- filtered
存储引擎返回的数据在server层过滤后，剩下多少满足查询的记录数量的比例(百分比)

- Extra
执行情况的说明和描述，包含不适合在其他列中显示但是对执行计划非常重要的额外信息

最主要的有一下三种：
```
Using Index	            表示索引覆盖，不会回表查询
Using Where	            表示进行了回表查询
Using Index Condition	表示进行了ICP优化
Using Flesort	        表示MySQL需额外排序操作, 不能通过索引顺序达到排序效果
```