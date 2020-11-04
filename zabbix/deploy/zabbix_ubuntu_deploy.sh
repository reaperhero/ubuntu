#!/bin/bash
# 自动注册
sudo mkdir /tmp/zabbix && sudo cd /tmp/zabbix
sudo apt-get install wget -y
zabbixserver='192.168.1.146'
sudo wget http://repo.zabbix.com/zabbix/4.1/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.1-1%2Bxenial_all.deb
sudo dpkg -i zabbix-release_4.1-1+xenial_all.deb
sudo apt-get update
sudo apt-get install zabbix-agent zabbix-sender -y
# sudo sed -i "/^Server=/s/Server=127.0.0.1/Server=${zabbixserver}/" /etc/zabbix/zabbix_agentd.conf
# sudo sed -i "/^ServerActive/s/ServerActive=127.0.0.1/ServerActive=${zabbixserver}/" /etc/zabbix/zabbix_agentd.conf
# sudo sed -i "/^Hostname=Zabbix server/s//# &/" /etc/zabbix/zabbix_agentd.conf
# sudo sed -i "/HostnameItem=system.hostname/s/# //" /etc/zabbix/zabbix_agentd.conf
# sudo sed -i "/# AllowRoot=0/s/# AllowRoot=0/AllowRoot=1/" /etc/zabbix/zabbix_agentd.conf
sudo systemctl enable zabbix-agent
sudo rm -rf /tmp/zabbix/zabbix-release_4.1-1+xenial_all.deb
