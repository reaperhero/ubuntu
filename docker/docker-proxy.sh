#!/bin/bash
mkdir -p /etc/systemd/system/docker.service.d
cat > /etc/systemd/system/docker.service.d/http-proxy.conf << EOF
[Service]
Environment="HTTP_PROXY=http://192.168.3.222:1089" "HTTPS_PROXY=http://192.168.3.222:1089"
EOF
systemctl daemon-reload
systemctl restart docker