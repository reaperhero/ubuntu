drop table if exists `user`;
CREATE TABLE `user` (
 `id` varchar(10) NOT NULL,
 `username` varchar(10) NOT NULL,
 `password` varchar(10) NOT NULL,
 PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 内连接（inner join）

-- 典型的联接运算，使用像 =  或 <> 之类的比较运算符）。包括相等联接和自然联接。

-- 内联接使用比较运算符根据每个表共有的列的值匹配两个表中的行。例如，检索 students和courses表中学生标识号相同的所有行。

select * from 表A inner join 表B on 判断条件;

-- 外连接

-- 左外连接（left join）以左表为主表（查询全部）， 右表为辅表（没有的显示null）

select * from 表A left join 表B on 判断条件;

-- 右外连接（right join）

-- 以右表为主表（查询全部）， 左表为辅表（没有的显示null）

select * from 表A right join 表B on 判断条件;

-- 全连接（full join）

-- 两个表的所有数据都展示出来

select * from 表A full join 表B on 判断条件;

-- 联合(union / union all）

-- union 操作符合并的结果集，不会允许重复值，如果允许有重复值的话，使用UNION ALL

select * from A   
union
select * from B




-- 前缀索引

ALTER TABLE table_name ADD KEY(column_name(prefix_length));




-- exists用于对外表记录做筛选。exists会遍历外表，将外查询表的每一行，代入内查询进行判断
-- exist类似于where条件，但是可以数据可以不是当前表
-- 当exists里的条件语句能够返回记录行时，条件就为真，返回外表当前记录。
-- 反之如果exists里的条件语句不能返回记录行，条件为假，则外表当前记录被丢弃。
select a.* from A a where exists(select 1 from B b where a.id=b.id)


-- in是先把后边的语句查出来放到临时表中，然后遍历临时表，将临时表的每一行，代入外查询去查找。
select * from Awhere id in(select id from B)