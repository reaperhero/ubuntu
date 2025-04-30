JumpServer 采用分层架构，分别是负载层、接入层、核心层、数据层、存储层。


组件说明
```
Core 组件是 JumpServer 的核心组件，其他组件依赖此组件启动。
Koko 是服务于类 Unix 资产平台的组件，通过 SSH、Telnet 协议提供字符型连接。 是 Go 版本的 coco，重构了 coco 的 SSH/SFTP 服务和 Web Terminal 服务。
Lion 是服务于 Windows 资产平台的组件，用于 Web 端访问 Windows 资产。实现 RDP/VNC 协议跳板机功能。
XRDP 是服务于 RDP 协议组件，该组件主要功能是通过 JumpServer Client 方式访问 windows 2000、XP 等系统的资产。
Razor 是服务于 RDP 协议组件，JumpServer Client 默认使用 Razor 组件访问 Windows 资产。
Magnus 是服务于数据库的组件，用于通过客户端代理访问数据库资产。
Kael 是服务于 GPT 资产平台的组件，用于纳管 ChatGPT 资产。
Chen 是服务于数据库的组件，用于通过 Web GUI 方式访问数据库资产。
Celery 是处理异步任务的组件，用于执行 JumpServer 相关的自动化任务。
Video 是专门处理 Razor 组件和 Lion 组件产生录像的格式转换工作，将产生的会话录像转化为 MP4 格式


Lina 是 JumpServer 的前端 UI 项目，主要使用 Vue，Element UI 完成。 （JumpServer Web UI ）https://github.com/jumpserver/lina
Luna 是 JumpServer 的前端 UI 项目，主要使用 Angular CLI 完成。  （Web Terminal）https://github.com/jumpserver/luna


```


[root@~]# docker ps -a
CONTAINER ID   IMAGE                       COMMAND                   CREATED        STATUS                  PORTS                                       NAMES
4bf36e091633   jumpserver/web:v4.0.2-ce    "/docker-entrypoint.…"   8 months ago   Up 2 months (healthy)   0.0.0.0:80->80/tcp, :::80->80/tcp           jms_web
02cc14c352d2   jumpserver/chen:v4.0.2-ce   "./entrypoint.sh wisp"    8 months ago   Up 2 months (healthy)   8082/tcp                                    jms_chen
01f379f7fd1f   jumpserver/core:v4.0.2-ce   "./entrypoint.sh sta…"   8 months ago   Up 2 months (healthy)   8080/tcp                                    jms_core
816075a9c04f   jumpserver/lion:v4.0.2-ce   "./entrypoint.sh sup…"   8 months ago   Up 2 months (healthy)   4822/tcp, 8081/tcp                          jms_lion
3c5b7ca49e5a   jumpserver/core:v4.0.2-ce   "./entrypoint.sh sta…"   8 months ago   Up 2 months (healthy)   8080/tcp                                    jms_celery
e1ffccff9807   jumpserver/koko:v4.0.2-ce   "./entrypoint.sh ./k…"   8 months ago   Up 2 months (healthy)   0.0.0.0:2222->2222/tcp, :::2222->2222/tcp   jms_koko
2a3907f1991a   postgres:16.3-bullseye      "docker-entrypoint.s…"   8 months ago   Up 2 months (healthy)   5432/tcp                                    jms_postgresql
bcf588e1ee1b   redis:7.0-bullseye          "docker-entrypoint.s…"   8 months ago   Up 2 months (healthy)   6379/tcp                                    jms_redis


```
server {
  listen 80;
  # server_name _;
  client_max_body_size 5000m; # 文件大小限制
  # Luna 配置
  location /luna/ {
    # 注意将模板中的组件名称替换为服务实际 ip 地址， 如都在本机部署
    # proxy_pass       http://127.0.0.1:4200;
    proxy_pass http://luna:4200;
  }
  # Core data 静态资源
  location /media/replay/ {
    add_header Content-Encoding gzip;
    root /opt/jumpserver-v3.10.1/data/;
  }
  location /static/ {
    root /opt/jumpserver-v3.10.1/data/;
  }
  # KoKo Lion 配置
  location /koko/ {
    # 注意将模板中的组件名称替换为服务实际 ip 地址， 如都在本机部署
    # proxy_pass       http://127.0.0.1:5000;
    proxy_pass       http://koko:5000;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header Host $host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_http_version 1.1;
    proxy_buffering off;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
  }
  # lion 配置
  location /lion/ {
    # 注意将模板中的组件名称替换为服务实际 ip 地址， 如都在本机部署
    # proxy_pass       http://127.0.0.1:8081;
    proxy_pass http://lion:8081;
    proxy_buffering off;
    proxy_request_buffering off;
    proxy_http_version 1.1;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection $http_connection;
    proxy_ignore_client_abort on;
    proxy_connect_timeout 600;
    proxy_send_timeout 600;
    proxy_read_timeout 600;
    send_timeout 6000;
  }
  location /ws/ {
    # 注意将模板中的组件名称替换为服务实际 ip 地址， 如都在本机部署
    # proxy_pass       http://127.0.0.1:8080;
    proxy_pass http://core:8080;
    proxy_buffering off;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header Host $host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }
  location ~ ^/(core|api|media)/ {
    # 注意将模板中的组件名称替换为服务实际 ip 地址， 如都在本机部署
    # proxy_pass       http://127.0.0.1:8080;
    proxy_pass http://core:8080;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header Host $host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }
  # 前端 Lina
  location /ui/ {
    # 注意将模板中的组件名称替换为服务实际 ip 地址， 如都在本机部署
    # proxy_pass       http://127.0.0.1:9528;
    proxy_pass http://lina:9528;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header Host $host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }
  location / {
    rewrite ^/(.*)$ /ui/$1 last;
  }
}
```