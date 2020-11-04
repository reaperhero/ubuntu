# mysql


## 常用函数

```
substring_index( address, ':', 1 )  # 根据:分隔，截取第一个字段
```


## 常用配置

```
sql-mode="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION";
```

## 常用语句

- 创建只读账户

```
CREATE USER 'readuser_name'@'%' IDENTIFIED BY 'readuser_password';
GRANT SELECT ON *.* TO 'readuser_name'@'%';
FLUSH PRIVILEGES;
```




## 常用curd

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
