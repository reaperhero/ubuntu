-- 做count聚合的时候空字符串算在其中，而null则不计算；
-- 做模糊查找的[not] like的时候null会被过滤掉，空字符串不会；
-- 计算字符串长度的时候null等于null，空字符串等于0；
-- 条件中使用<> "" 不但会剔除空字符串，同样null也会剔除；
-- 条件中使用 = "" 只会出现有空字符串的内容，但null的会被剔除；

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


SELECT CONCAT('MySQL', '字符串', '函数') AS str;
SELECT LOWER('MySQL字符串函数') AS str1, LCASE('MySQL字符串函数') AS str2;
SELECT UPPER('MySQL字符串函数') AS str1, UCASE('MySQL字符串函数') AS str2;
SELECT LENGTH('MySQL字符串函数') AS len1, OCTET_LENGTH('MySQL字符串函数') AS len2;
SELECT CHAR_LENGTH('MySQL字符串函数') AS len1, CHARACTER_LENGTH('MySQL字符串函数') AS len2;
SELECT SUBSTRING('MySQL字符串函数', 0,6) AS str1  // pos 可以为负数，此时返回的子串从字符串右侧第 pos 个字符开始
SELECT SUBSTRING_INDEX('张三;李四;王五', ';', 2) AS str1,  // 第 count 个分隔符 delim 之前的子串。如果 count 为正数，从左侧开始计数并返回左侧的所有字符；如果 count 为负数，从右侧开始计数并返回右侧的所有字符
SELECT TRIM('  MySQL字符串函数  ') AS str1,
SELECT TRIM(LEADING 'M' FROM '  MySQL字符串函数M') AS str1,  //  删除两侧字符串M


