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
    root /var/www/baidu;

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

## 日志格式
    
```
        log_format upstream_time '{ "@timestamp": "$time_local", '
        '"remote_addr": "$remote_addr", '
        '"url":"$request_uri",'
        '"referer": "$http_referer", '
        '"request": "$request", '
        '"request_method": "$request_method", '
        '"status": $status, '
        '"bytes": $body_bytes_sent, '
        '"agent": "$http_user_agent", '
        '"x_forwarded": "$http_x_forwarded_for", '
        '"up_addr": "$upstream_addr",'
        '"up_host": "$upstream_http_host",'
        '"up_resp_time": "$upstream_response_time",'
        '"request_time": "$request_time"'
        ' }';
```

## 长连接
nginx作为反向代理时，为了支持长连接，需要从client到nginx的连接是长连接，从nginx到server的连接是长连接

1. 保持和client的长连接
```
http {
    keepalive_timeout  120s 120s; // 保持开启的超时值， 响应的header域
    keepalive_requests 10000;     // 设置一个keep-alive连接上可以服务的请求的最大数量，当最大请求数量达到时，连接被关闭
}
```

2、保持和server的长连接
```
http {
    upstream  BACKEND {
        server   192.168.0.1：8080  weight=1 max_fails=2 fail_timeout=30s;
        server   192.168.0.2：8080  weight=1 max_fails=2 fail_timeout=30s;
        keepalive 300;        // upstream服务器的空闲keepalive连接的最大数量，当这个数量被突破时，最近使用最少的连接将被关闭
    }
server {
        listen 8080 default_server;
        server_name "";
        location /  {
            proxy_pass http://BACKEND;
            proxy_set_header Host  $Host;
            proxy_set_header x-forwarded-for $remote_addr;
            proxy_set_header X-Real-IP $remote_addr;
            add_header Cache-Control no-store;
            add_header Pragma  no-cache;
            proxy_http_version 1.1;   // HTTP协议中对长连接的支持是从1.1版本之后才有的，因此最好通过proxy_http_version指令设置为”1.1”；
            proxy_set_header Connection ""; // client和nginx之间是短连接，nginx和upstream之间也是可以开启长连接,但是header应该被清理
        }
    }
}
```
