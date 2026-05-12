# Kingbase 常见操作

## 1. 连接数据库

### 1.1 使用 `ksql` 连接

```bash
ksql -h 127.0.0.1 -p 54321 -U system -d testdb
```

参数说明：

- `-h`：数据库主机
- `-p`：数据库端口
- `-U`：用户名
- `-d`：数据库名

### 1.2 连接后查看当前信息

```sql
SELECT version();
SELECT current_database();
SELECT current_user;
SELECT now();
```

## 2. 数据库操作

### 2.1 查看数据库

```sql
\l
```

### 2.2 创建数据库

```sql
CREATE DATABASE appdb;
```

### 2.3 切换数据库

```sql
\c appdb
```

### 2.4 删除数据库

```sql
DROP DATABASE appdb;
```

注意：删除前确保没有会话连接到目标库。

## 3. Schema 与表操作

### 3.1 查看 schema

```sql
\dn
```

### 3.2 创建 schema

```sql
CREATE SCHEMA biz;
```

### 3.3 查看表

```sql
\dt
\dt biz.*
```

### 3.4 创建表

```sql
CREATE TABLE biz.user_info (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(64) NOT NULL,
    status INT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 3.5 查看表结构

```sql
\d biz.user_info
```

### 3.6 修改表结构

```sql
ALTER TABLE biz.user_info ADD COLUMN mobile VARCHAR(20);
ALTER TABLE biz.user_info ALTER COLUMN username TYPE VARCHAR(128);
ALTER TABLE biz.user_info DROP COLUMN mobile;
ALTER TABLE biz.user_info RENAME TO user_account;
```

### 3.7 删除表

```sql
DROP TABLE biz.user_info;
TRUNCATE TABLE biz.user_info;
```

区别说明：

- `DROP TABLE`：删除表结构和数据
- `TRUNCATE TABLE`：保留表结构，清空数据

## 4. 数据增删改查

### 4.1 插入数据

```sql
INSERT INTO biz.user_info (username, status)
VALUES ('alice', 1);
```

### 4.2 查询数据

```sql
SELECT * FROM biz.user_info;
SELECT * FROM biz.user_info WHERE status = 1;
SELECT count(*) FROM biz.user_info;
```

### 4.3 更新数据

```sql
UPDATE biz.user_info
SET status = 0
WHERE username = 'alice';
```

### 4.4 删除数据

```sql
DELETE FROM biz.user_info
WHERE username = 'alice';
```

## 5. 用户与权限管理

### 5.1 查看用户

```sql
\du
```

### 5.2 创建用户

```sql
CREATE USER app_user WITH PASSWORD 'StrongPassword123';
```

### 5.3 修改密码

```sql
ALTER USER app_user WITH PASSWORD 'NewStrongPassword123';
```

### 5.4 授权数据库与 schema

```sql
GRANT CONNECT ON DATABASE appdb TO app_user;
GRANT USAGE ON SCHEMA biz TO app_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA biz TO app_user;
```

### 5.5 回收权限

```sql
REVOKE ALL ON ALL TABLES IN SCHEMA biz FROM app_user;
```

### 5.6 删除用户

```sql
DROP USER app_user;
```

## 6. 索引与执行计划

### 6.1 创建索引

```sql
CREATE INDEX idx_user_info_username ON biz.user_info(username);
CREATE UNIQUE INDEX uk_user_info_username ON biz.user_info(username);
```

### 6.2 查看执行计划

```sql
EXPLAIN SELECT * FROM biz.user_info WHERE username = 'alice';
EXPLAIN ANALYZE SELECT * FROM biz.user_info WHERE username = 'alice';
```

## 7. 事务控制

```sql
BEGIN;

UPDATE biz.user_info
SET status = 1
WHERE id = 1;

COMMIT;
ROLLBACK;
```

说明：

- `COMMIT`：提交事务
- `ROLLBACK`：回滚事务

## 8. 备份与恢复

### 8.1 使用 `sys_dump` 备份数据库

```bash
sys_dump -h 127.0.0.1 -p 54321 -U system -d appdb > appdb.sql
```

### 8.2 备份指定表

```bash
sys_dump -h 127.0.0.1 -p 54321 -U system -d appdb -t biz.user_info > user_info.sql
```

### 8.3 恢复 SQL 文件

```bash
ksql -h 127.0.0.1 -p 54321 -U system -d appdb -f appdb.sql
```

### 8.4 恢复前清理对象

```sql
DROP DATABASE appdb;
CREATE DATABASE appdb;
```

## 9. 导入导出数据

### 9.1 导出查询结果到 CSV

```sql
\copy (SELECT * FROM biz.user_info) TO '/tmp/user_info.csv' CSV HEADER;
```

### 9.2 从 CSV 导入数据

```sql
\copy biz.user_info(username, status) FROM '/tmp/user_info.csv' CSV HEADER;
```

## 10. 常用运维排查

### 10.1 查看当前连接

```sql
SELECT pid, usename, datname, client_addr, state, query
FROM sys_stat_activity;
```

### 10.2 杀掉会话

```sql
SELECT sys_terminate_backend(pid)
FROM sys_stat_activity
WHERE datname = 'appdb'
  AND pid <> sys_backend_pid();
```

### 10.3 查看锁等待

```sql
SELECT *
FROM sys_locks;
```

### 10.4 查看表大小

```sql
SELECT
    relname,
    pg_size_pretty(pg_total_relation_size(relid)) AS total_size
FROM pg_stat_user_tables
ORDER BY pg_total_relation_size(relid) DESC;
```

## 11. 常用元命令

```sql
\?
\l
\c appdb
\dn
\dt
\d biz.user_info
\du
\q
```

## 12. 注意事项

- Kingbase 不同版本在系统视图、函数名、工具名上可能有差异，执行前先确认版本。
- 生产环境执行 `DROP`、`TRUNCATE`、批量 `DELETE` 前先备份。
- 涉及权限调整时，建议区分普通业务账号与管理员账号。
- 导入导出文件时，注意数据库服务器与客户端文件路径权限。
