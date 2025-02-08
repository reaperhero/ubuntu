#!/usr/bin/python3
 
import pymysql
 

 
# SQL 更新语句 将 TESTDB 表中 SEX 为 'M' 的 AGE 字段递增 1
try:
   # 打开数据库连接
   db = pymysql.connect("localhost","testuser","test123","TESTDB" )
   
   # 使用cursor()方法获取操作游标 
   cursor = db.cursor()
   sql = f"UPDATE {table} SET column_name = %s WHERE id = %s"
   # 执行SQL语句
   cursor.execute(sql, (new_value, id_value))
   # 提交到数据库执行
   db.commit()
except:
   # 发生错误时回滚
   db.rollback()
finally:
   # 关闭数据库连接
   cursor.close()
   db.close()