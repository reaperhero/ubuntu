#!/bin/bash
emulate bash
yum install zsh git -y
chsh -s $(which zsh)
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cat << EOF > ~/.zshrc
export ZSH="/root/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh
HIST_STAMPS="yyyy-mm-dd"
alias history='fc -il 1'
EOF
source ~/.zshrc
