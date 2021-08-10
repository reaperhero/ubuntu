# 查看是否开启
systemctl status firewalld.service
# 打开防火墙
systemctl start firewalld.service
# 停用防火墙
systemctl disable firewalld
# 禁用防火墙
systemctl stop firewalld.service
# 开机启动
systemctl enable firewalld
# 取消开机启动
systemctl disable firewalld

firewall-cmd --list-all
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --reload






# 查看运行状态
firewall-cmd --state
# 查看接口信息
firewall-cmd --list-all

# 更新防火墙规则方法1:无需断开连接，动态更改规则
firewall-cmd --reload
# 更新防火墙规则方法2:断开连接，以重启的方式更改规则
firewall-cmd --complete-reload

# 查看帮助
firewall-cmd --help
--zone=NAME # 指定 Zone
--permanent # 为永久生效
--timeout=seconds # 持续一段时间，到期后自动移除，经常用于调试，且不能与 --permanent 同时使用

# 追加一个8181端口，永久有效
firewall-cmd --add-port=8181/tcp --permanent
# 追加一段端口范围
firewall-cmd --add-port=6000-6600/tcp
# 开放 ftp 服务
firewall-cmd --add-service=ftp
# 添加eth0 接口至 public 信任等级，永久有效
firewall-cmd --zone=public --add-interface=eth0 --permanent

# 配置 public zone 的端口转发
firewall-cmd --zone=public --add-masquerade
# 然后转发 tcp 22 端口至 9527
firewall-cmd --zone=public --add-forward-port=port=22:proto=tcp:toport=9527
# 转发 22 端口数据至另一个 ip 的相同端口上
firewall-cmd --zone=public --add-forward-port=port=22:proto=tcp:toaddr=192.168.1.123
# 转发 22 端口数据至另一 ip 的 9527 端口上
firewall-cmd --zone=public --add-forward-port=port=22:proto=tcp:toport=9527:toaddr=192.168.1.100

# IP 封禁
firewall-cmd --permanent --add-rich-rule="rule family='ipv4' source address='192.168.1.123' reject"
# 通过 ipset 来封禁 ip
firewall-cmd --permanent --zone=public --new-ipset=blacklist --type=hash:ip
firewall-cmd --permanent --zone=public --ipset=blacklist --add-entry=192.168.1.123
# 封禁网段
firewall-cmd --permanent --zone=public --new-ipset=blacklist --type=hash:net
firewall-cmd --permanent --zone=public --ipset=blacklist --add-entry=192.168.1.0/24
# 倒入 ipset 规则 blacklist，然后封禁 blacklist
firewall-cmd --permanent --zone=public --new-ipset-from-file=/path/blacklist.xml
firewall-cmd --permanent --zone=public --add-rich-rule='rule source ipset=blacklist drop'