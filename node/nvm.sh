#!/bin/bash


# install
cd /
wget https://github.com/nvm-sh/nvm/archive/refs/tags/v0.39.1.tar.gz
mkdir -p /.nvm
tar -zxvf nvm-0.39.0.tar.gz -C /.nvm

# ~/.bashrc
export NVM_DIR="/.nvm/nvm-0.38.0"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# set mirror
nvm node_mirror https://npm.taobao.org/mirrors/node/
nvm npm_mirror https://npm.taobao.org/mirrors/npm/

# 查看已安装的版本
nvm ls
# 安装指定版本的node
nvm install 16
# 切换node版本
nvm use 16

export NVM_NODEJS_ORG_MIRROR=http://nodejs.org/dist
nvm install 12.16.0