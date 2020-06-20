优化场景：后端为kuberentes集群，前端为一台nginx代理服务器

## k8s 
```
apiVersion: v1
kind: ConfigMap
metadata:
  labels:
    app: ingress-controller
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
  name: nginx-configuration
  namespace: ingress-nginx
data:
  disable-access-log: "false"
  keep-alive: "2000"
  keep-alive-requests: "1000000"
  max-worker-connections: "100000"
  max-worker-open-files: "204800"
  upstream-keepalive-connections: "1024"
  upstream-keepalive-requests: "10000000"
  upstream-keepalive-timeout: "2000"
  worker-cpu-affinity: auto
  worker-processes: auto
```

## linux优化
```
net.ipv4.ip_forward = 0
net.ipv4.conf.default.rp_filter = 1
net.ipv4.conf.default.accept_source_route = 0
kernel.sysrq = 0
kernel.core_uses_pid = 1
net.ipv4.tcp_syncookies = 1
kernel.msgmnb = 65536
kernel.msgmax = 65536
kernel.shmmax = 68719476736
kernel.shmall = 4294967296
net.ipv4.tcp_max_tw_buckets = 500000
net.ipv4.tcp_sack = 1
net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_rmem = 4096 87380 4194304
net.ipv4.tcp_wmem = 4096 16384 4194304
net.core.wmem_default = 8388608
net.core.rmem_default = 8388608
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.core.netdev_max_backlog = 262144
net.core.somaxconn = 65535
net.ipv4.tcp_max_orphans = 3276800
net.ipv4.tcp_max_syn_backlog = 262144
net.ipv4.tcp_timestamps = 1
net.ipv4.tcp_synack_retries = 1
net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_tw_recycle = 0
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_mem = 94500000 915000000 927000000
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_keepalive_time = 30
net.ipv4.ip_local_port_range = 1024 65000
net.nf_conntrack_max = 6553500
```

## nginx优化

```
worker_processes 16;
worker_cpu_affinity 0000000000000001 0000000000000010 0000000000000100 0000000000001000 0000000000010000 0000000000100000 0000000001000000 0000000010000000 0000000100000000 0000001000000000 0000010000000000 0000100000000000 0001000000000000 0010000000000000 0100000000000000 1000000000000000;


pid /var/run/nginx.pid;
worker_rlimit_nofile 204800;

events {
  worker_connections 1000;
  use epoll;
}


http {
  keepalive_timeout 10s 10s;  # 客户端连接在服务器端保持开启的超时值
  keepalive_requests 1000;   #一个keep-alive连接上可以服务的请求的最大数量
  include /etc/nginx/mime.types;
  default_type application/octet-stream;
  charset utf-8;
  proxy_http_version 1.1;
  server_names_hash_bucket_size 128;
  client_header_buffer_size 2k;
  large_client_header_buffers 4 4k;
  client_max_body_size 1024M;
  sendfile on;
  send_timeout 60s;
  tcp_nopush on;
  server_tokens off;

  proxy_redirect off;
  proxy_set_header Host $host;
  proxy_set_header X-Real-IP $remote_addr;
  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  client_body_buffer_size 128k;
  proxy_connect_timeout 60;
  proxy_send_timeout 300;
  proxy_read_timeout 300;
  proxy_buffer_size 4k;
  proxy_buffers 32 4k;
  proxy_busy_buffers_size 64k;

  fastcgi_connect_timeout 3000;
  fastcgi_send_timeout 3000;
  fastcgi_read_timeout 3000;
  fastcgi_buffer_size 16k;
  fastcgi_buffers 16 16k;
  fastcgi_busy_buffers_size 16k;
  fastcgi_temp_file_write_size 16k;
  fastcgi_cache_valid 200 302 1h;
  fastcgi_cache_valid 301 1d;
  fastcgi_cache_valid any 1m;
  fastcgi_cache_min_uses 1;
  fastcgi_cache_use_stale error timeout invalid_header http_500;

  open_file_cache max=204800 inactive=240s;
  open_file_cache_min_uses 1;
  open_file_cache_valid 240s;


  tcp_nodelay on;
  gzip on;
  gzip_min_length 1k;
  gzip_buffers 4 16k;
  gzip_http_version 1.0;
  gzip_comp_level 2;
  gzip_types text/plain application/x-javascript text/css application/xml;
  gzip_vary on;

  log_format main '{ "@timestamp": "$time_local", '
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
  error_log /var/log/nginx/error.log warn;
  access_log /var/log/nginx/access.log main;
  include /etc/nginx/conf.d/*.conf;
}

upstream ingress-nginx {
  server 192.168.179.11:32154    weight=5 fail_timeout=20s;
  server 192.168.179.12:32154    weight=5 fail_timeout=20s;
  server 192.168.179.13:32154    weight=5 fail_timeout=20s;
  server 192.168.179.14:32154    weight=5 fail_timeout=20s;
  server 192.168.179.16:32154    weight=5 fail_timeout=20s;
  server 192.168.179.37:32154    weight=5 fail_timeout=20s;
  server 192.168.179.38:32154    weight=5 fail_timeout=20s;
  server 192.168.179.39:32154    weight=5 fail_timeout=20s;
  server 192.168.179.40:32154    weight=5 fail_timeout=20s;
  server 192.168.179.41:32154    weight=5 fail_timeout=20s;
  keepalive 100000;
}
```

server {
    listen 80;
    server_name www/chenqiangjun.com;
    location / {
        proxy_pass http://ingress-nginx;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_http_version 1.1;
        proxy_set_header Connection "";
     }
}

