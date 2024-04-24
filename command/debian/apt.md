

apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
cat > /etc/apt/sources.list << EOF
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free
deb https://security.debian.org/debian-security bullseye-security main contrib non-free
EOF
