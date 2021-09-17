#!/bin/bash
export https_proxy=http://192.168.31.125:7890 http_proxy=http://192.168.31.125:7890 all_proxy=socks5://192.168.31.125:7891
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install jenkins -y
