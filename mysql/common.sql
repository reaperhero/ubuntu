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
SELECT LPAD(123, 6, '0') AS str1, LPAD(123, 2, '0') AS str2,  // LPAD (str,len,padstr) 函数表示字符串 str 的左侧使用 padstr 进行填充，直到长度为 len；RPAD (str,len,padstr) 函数表示在字符串 str 的右侧使用 padstr 进行填充，直到长度为 len
SELECT REPEAT('🔥', 5) AS str;

select INSTR('MySQL字符串函数', '字符串') AS index1,  // INSTR (str,substr) 函数用于返回子串 substr 在字符串 str 中第一次出现的索引位置，没有找到子串时返回 0
SELECT LOCATE('S','MySQL Server', 5) AS ind; // LOCATE (substr,str,pos) 函数返回子串 substr 在字符串 str 中从位置 pos 开始第一次出现的索引位置

SELECT FIELD('李四', '张三', '李四', '王五') AS ind;  //  FIELD (str,str1,str2,str3,…) 函数返回字符串 str 在后续字符串列表中出现的位置，没有找到时返回 0
SELECT FIND_IN_SET('李四', '张三,李四,王五') AS ind;  // FIND_IN_SET (str,strlist) 函数返回字符串 str 在列表字符串 strlist 中出现的位置，strlist 由 N 个子串使用逗号分隔组
SELECT REPLACE('MySQL字符串函数', '字符串', '日期') AS str1,
SELECT INSERT('MySQL字符串函数', 6, 3, '日期') AS str;  // INSERT (str,pos,len,newstr) 函数用于在字符串 str 的指定位置 pos 之后插入子串 newstr，替换随后的 len 个字符
SELECT REVERSE('上海自来水来自海上')='上海自来水来自海上' AS "回文";

