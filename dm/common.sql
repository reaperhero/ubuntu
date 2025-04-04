

select * from v$database;
select * from v$version;
select * from v$sessions;
select * from v$option
select * from v$tablespace;
SELECT * FROM v$instance;
select * from dba_users;  -- 用户
SELECT * FROM ALL_ALL_TABLES; -- 查看有哪些表'
SELECT * FROM user_tables;    -- 查看当前用户的表
select * from all_tab_columns; -- 查看有哪些字段
select * from dba_data_files; -- 查看表空间数据文件信息
select * from dba_free_space; -- 查看数据文件空闲信息
SELECT CONCAT('drop TABLE ',TABLE_NAME) FROM user_tables;    -- 批量删除表


set feed 10; -- 分页显示

SET SCHEMA SALES; -- 切换模式，从当前模式切换到SALES模式


drop schema "dtagent" cascade;  -- 删除模式
DROP USER "dtagent" CASCADE;      -- 删除用户

select  USERNAME,NAME AS SCHEMA_NAME,TYPE$ 
FROM SYSOBJECTS A,DBA_USERS B 
WHERE A.PID=B.USER_ID AND A.TYPE$='SCH' AND B.USERNAME='DTAGENT';  -- 查看当前用户拥有的模式

select * from V$PARAMETER;   -- 查询参数

select * from  v$DM_INI where para_name = 'COMPATIBLE_MODE' -- 查看兼容模式

select * from v$option where PARA_NAME='GLOBAL_STR_CASE_SENSITIVE'; -- 查询大小写敏感

select SF_GET_UNICODE_FLAG();  -- 查看达梦数据库编码： 0 表示 GB18030，1 表示 UTF-8，2 表示 EUC-KR

create tablespace  tablespaceName datafile '/data/dm/data/DAMENG/hive_meta.dbf' size 100 autoextend on next 1 maxsize 2048;
SELECT * FROM DBA_DATA_FILES 

select dbms_metadata.get_ddl('TABLE','USER') from dual;
SELECT DBMS_METADATA.GET_DDL('TABLE','progress_history','SYSDBA') FROM DUAL;

/*创建用户并指定表空间  */ 
create user czss identified by czssczss default tablespace czss temporary tablespace temp;

-- 使用 conn 命令切换用户。
conn DM/dameng123;

-- 查看最慢20条SQL
select TOP 20* from V$SYSTEM_LONG_EXEC_SQLS ORDER BY EXEC_TIME DESC; 
-- 查看最近的20条慢sql
select * from V$LONG_EXEC_SQLS order by EXEC_TIME DESC limit 0,20;


select * from dba_objects where OBJECT_NAME= 'DTAGENT'


CREATE SCHEMA SCHEMA1 AUTHORIZATION SYSDBA;

-- 用户与模式的对应关系
select a.name as username, b.name as schenma from sysobjects a inner join sysobjects b on a.id = b.pid where b.subtype$ is null order by username desc;

-- 查看表主键外键
SELECT table_name, constraint_name, constraint_type FROM all_constraints WHERE owner='DM' AND table_name='EMPLOYEE';


-- 创建表
CREATE TABLE employee
(
  employee_id INTEGER,
  employee_name VARCHAR2(20) NOT NULL,
  hire_date DATE,
  salary INTEGER,
  department_id INTEGER NOT NULL
);
-- 使用 CREATE TABLE 语句创建 department 表
CREATE TABLE department
(
  department_id INTEGER PRIMARY KEY,
  department_name VARCHAR(30) NOT NULL
);

-- 若该表存在则删除
DROP TABLE IF EXISTS department; 

-- 非空约束
ALTER TABLE employee MODIFY( hire_date not null);
-- 主键约束
ALTER TABLE employee ADD constraint pk_empid PRIMARY KEY(employee_id);
-- 外键约束
ALTER TABLE employee ADD constraint fk_dept FOREIGN KEY (department_id) REFERENCES department (department_id);
-- 增加删除字段
ALTER TABLE "EMPLOYEE" add "IS_REPEAT" VARCHAR(255);
ALTER TABLE "EMPLOYEE" DROP COLUMN IS_REPEAT;


-- 字段注释
COMMENT ON COLUMN "EMPLOYEE"."IS_REPEAT" IS '是否重复，1、是，0、否';

-- 插入数据
INSERT INTO department VALUES(666, '数据库产品中心');
INSERT INTO TEST_TEMP(ID,PROJECT_KEY,CREAT_TIME) VALUES (1, '测试项目', '2022-12-15 14:15:30');
INSERT INTO irm_department (id, active, create_time, creator_id, deleted, level, name, parent_id, update_time, updated_by) VALUES (1, 1, cast('2021-07-24 18:28:09' as datetime(6)), 3, 0, 1, '总部', 0,cast('2021-07-24 18:28:09' as datetime(6)), 'admin'); -- active的值为1


-- 查看有哪些schema
select NAME, ID, PID, CRTDATE from SYS.SYSOBJECTS where TYPE$='SCH'



ALTER TABLE 旧表名 RENAME TO 新表名; -- 修改表名

ALTER TABLE 表名 RENAME COLUMN 旧字段名 TO 新字段名; -- 修改字段名



update table_name set table_field = RTRIM(table_field); -- 去除字段尾部的空格