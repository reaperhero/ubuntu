

docker pull postgres:alpine


docker volume create postgre-data


docker run -id --name=postgresql -v postgre-data:/var/lib/postgresql/data -p 5432:5432 -e POSTGRES_PASSWORD=123456 -e LANG=C.UTF-8 postgres






# 登录到 PostgreSQL
psql -U postgres

# 在 psql 中执行创建数据库命令
CREATE DATABASE database_name;