#!/usr/bin/python3
 
import pymysql
 
# 打开数据库连接
db = pymysql.connect(host="7f7garhw.2401.dnstoo.com", port=5504 ,user="minixapi_f", password="apiminixtop", database="minixapi", charset="utf8" )
 
# 使用 cursor() 方法创建一个游标对象 cursor
cursor = db.cursor()
 
# 使用 execute()  方法执行 SQL 查询 
cursor.execute("SELECT VERSION()")
 
# 使用 fetchone() 方法获取单条数据.
data = cursor.fetchone()
 
print ("Database version : %s " % data)
 
# 关闭数据库连接
db.close()