[mysqld]
pid-file= /var/run/mysqld/mysqld.pid
socket= /var/run/mysqld/mysqld.sock
datadir= /var/lib/mysql
sql-mode="NO_AUTO_Create_USER,NO_ENGINE_SUBSTITUTION"
symbolic-links=0

[mysqldump]
quick
quote-names
max_allowed_packet  = 16M