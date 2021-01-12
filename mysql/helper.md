


- 常用语句

```
创建只读账户
CREATE USER 'readuser_name'@'%' IDENTIFIED BY 'readuser_password';
GRANT SELECT ON *.* TO 'readuser_name'@'%';
FLUSH PRIVILEGES;

批量替换
update 表名 set 字段1 = replace(字段1,'c','C'); 
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