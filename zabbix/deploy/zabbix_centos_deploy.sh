#!/bin/bash
# 自动注册
mkdir /tmp/zabbix && cd /tmp/zabbix
yum install wget -y
zabbixserver='192.168.1.146'
wget http://repo.zabbix.com/zabbix/4.1/rhel/7/x86_64/zabbix-release-4.1-1.el7.noarch.rpm
rpm -ivh zabbix-release-4.1-1.el7.noarch.rpm
yum install zabbix-agent zabbix-sender -y
# sed -i "/^Server=/s/Server=127.0.0.1/Server=${zabbixserver}/" /etc/zabbix/zabbix_agentd.conf
# sed -i "/^ServerActive/s/ServerActive=127.0.0.1/ServerActive=${zabbixserver}/" /etc/zabbix/zabbix_agentd.conf
# sed -i "/^Hostname=Zabbix server/s//# &/" /etc/zabbix/zabbix_agentd.conf
# sed -i "/HostnameItem=system.hostname/s/# //" /etc/zabbix/zabbix_agentd.conf
# sed -i "/# AllowRoot=0/s/# AllowRoot=0/AllowRoot=1/" /etc/zabbix/zabbix_agentd.conf
systemctl enable zabbix-agent
rm -fr /tmp/zabbix/zabbix-release-4.1-1.el7.noarch.rpm
