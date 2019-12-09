1、安装privoxy
brew install privoxy


2、覆盖配置/usr/local/etc/privoxy/config

confdir /usr/local/etc/privoxy
logdir /usr/local/var/log/privoxy
actionsfile match-all.action # Actions that are applied to all sites and maybe overruled later on.
actionsfile default.action   # Main actions file
actionsfile user.action      # User customizations
filterfile default.filter
filterfile user.filter      # User customizations
logfile logfile
listen-address  127.0.0.1:8118
toggle  1
enable-remote-toggle  0
enable-remote-http-toggle  0
enable-edit-actions 0
enforce-blocks 0
buffer-limit 4096
enable-proxy-authentication-forwarding 0
trusted-cgi-referer http://www.example.org/
forwarded-connect-retries  0
accept-intercepted-requests 0
allow-cgi-request-crunching 0
split-large-forms 0
keep-alive-timeout 5
tolerate-pipelining 1
socket-timeout 300
listen-address  0.0.0.0:1090
forward-socks5 / ip:port .

3、启动
/usr/local/sbin/privoxy /usr/local/etc/privoxy/config


4、使用
export http_proxy=http://192.168.2.150:1090 https_proxy=http://192.168.2.150:1090
