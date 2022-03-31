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

SQL：select * from 表A left join 表B on 判断条件;

-- 右外连接（right join）

-- 以右表为主表（查询全部）， 左表为辅表（没有的显示null）

SQL：select * from 表A right join 表B on 判断条件;

-- 全连接（full join）

-- 两个表的所有数据都展示出来

SQL：select * from 表A full join 表B on 判断条件;

-- 联合(union / union all）

union 操作符合并的结果集，不会允许重复值，如果允许有重复值的话，使用UNION ALL