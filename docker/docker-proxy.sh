#!/bin/bash
mkdir -p /etc/systemd/system/docker.service.d
cat > /etc/systemd/system/docker.service.d/http-proxy.conf << EOF
[Service]
Environment="HTTP_PROXY=http://192.168.2.150:1090" "HTTPS_PROXY=http://192.168.2.150:1090"
EOF
systemctl daemon-reload
systemctl restart docker
