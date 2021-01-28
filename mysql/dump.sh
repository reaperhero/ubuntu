# 备份

```
全库备份
mysqldump -h 127.0.0.1 -uroot -p'123456' -E --triggers -e --max_allowed_packet=16777216 --net_buffer_length=16384  --master-data=2 --single-transaction --all-databases --quick  | gzip > all_database_bak_471_`date +%Y-%m-%d_%H_%M_%S`.sql.gz

```



# 恢复

```
sed -n '/^-- Current Database: `db_name`/,/^-- Current Database: `/p' all_database_bak_471_2017-12-04_15_36_38.sql > db_log.sql # 从全备中过滤db_name库的sql
```



