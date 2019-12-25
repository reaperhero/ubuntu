# 匹配规则

## 1. location

- proxy_pass有/
```
location  /proxy/ {
	proxy_pass http://127.0.0.1:81/;
}
```
curl http://localhost/proxy/test.html  --->   http://127.0.0.1:81/test.html 



- proxy_pass没有/

```
location  /proxy/ {
	proxy_pass http://127.0.0.1:81;
}
```

curl http://localhost/proxy/test.html  --->  http://127.0.0.1:81/proxy/test.html

- proxy带路径带/

```
location  /proxy/ {
	proxy_pass http://127.0.0.1:81/ftlynx/;
}
```

curl http://localhost/proxy/test.html  --->   http://127.0.0.1:81/ftlynx/test.html 

- proxy带路径不带/

```
location  /proxy/ {
	proxy_pass http://127.0.0.1:81/ftlynx;
}
```

curl http://localhost/proxy/test.html  --->   http://127.0.0.1:81/ftlynxtest.html

## 限流

- 漏桶算法 limit_req_zone

```
http {
    limit_req_zone $binary_remote_addr zone=one:10m rate=1r/s;  
    # $binary_remote_addr:限制同一客户端IP
    # zone=one:10m表示生成一个大小为10M，名字为one的内存区域，用来存储访问的频次信息
    # rate=1r/s表示允许相同标识的客户端的访问频次
    server {
        location /search/ {
            limit_req zone=one burst=5 nodelay;
            # zone=one 设置使用哪个配置区域来做限制，与上面limit_req_zone 里的name对应
            # burst=5，设置一个大小为5的缓冲区，当有大量请求（爆发）过来时，超过了访问频次限制的请求可以先放到这个缓冲区内
            # nodelay，如果设置，超过访问频次而且缓冲区也满了的时候就会直接返回503，如果没有设置，则所有请求会等待排队。
        }
}  
```

例如
```
limit_req_zone $binary_remote_addr zone=mylimit:10m rate=1r/s;
server {
        listen 80;
        server_name default_server;


        access_log  /var/log/nginx/access.log;
        error_log  /var/log/nginx/error.log;

        limit_req zone=mylimit burst=4 nodelay;
       # limit_req_status 402;
    root /var/www/mudutv;

    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

- 令牌桶算法 ngx_http_limit_conn

配置多个limit_conn指令。配置将限制每个客户端IP连接到服务器的数量，同时限制连接到虚拟服务器的总数
```
limit_conn_zone $binary_remote_addr zone=perip:10m;
limit_conn_zone $server_name zone=perserver:10m;

server {
    limit_conn perip 10;  #限制每个客户端IP连接到服务器的数量
    limit_conn perserver 100; #限制连接到虚拟服务器的总数
}
```



