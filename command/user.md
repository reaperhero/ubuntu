# 创建用户
groupadd admin
useradd  -d  /home/ops -e 999999 -m -s /bin/bash ops
usermod -a -G admin ops
mkdir /home/ops/.ssh
cat > /home/ops/.ssh/authorized_keys << EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvk6QBbf0B5bLaiuXTIxKyB7XGuI+WEPQNKkGtout2wZ8eYeRrkymDugvgE03xeSJcs1AiQAgelykKTwPKJ3/yItzhpPmAfdOuQ6IUBvBkUNjwxCc/JRg3Mp41bjFC2EqClZZc+/fatJbGTVThQ38veG6YjnmJTJ1Oz2Pe4M7Y/xfc+CcAVpXiyoVYG/T0TcvzQsZe8dxhNptO+M0Wt51A3MbgHHIfPWIY+BFAMw6PTpLcsKB9qZ+7w62batmUYE+OS1VQgCN+A9XSJWrjG8SgYU06yB8oPDxXi0NYTdsUjCrx0QSrK0wX3WX2J/wy/gu9eylQwPQ4HpPe33NnG6el ops@general-online
EOF
chown -R ops:ops /home/ops


# 授权

%admin ALL=(ALL) NOPASSWD: ALL