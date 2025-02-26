
brew install pyenv

export PYENV_ROOT=~/.pyenv
export PATH=$PYENV_ROOT/shims:$PATH


pyenv install --list //查看所有可以安装的python版本



pyenv install 3.8.9
pyenv uninstall 3.8.9
pyenv rehash # 在进行安装、删除指定python版本后使用，更新版本管理数据库


pyenv versions   // 查看当前安装的所有版本

pyenv global 3.8.9  // 全局切换
pyenv local 3.5.5  // 局部切换 当前目录及其子目录生效（激活）  pyenv local --unset(激活后，在每次进入该目录时会自动切换到指定的版本。如果取消激活则使用--unset参数)




使用方式: pyenv <命令> [<参数>]

命令:
```
  commands    查看所有命令
  local       设置或显示本地的Python版本
  global      设置或显示全局Python版本
  shell       设置或显示shell指定的Python版本
  install     安装指定Python版本
  uninstall   卸载指定Python版本)
  version     显示当前的Python版本及其本地路径
  versions    查看所有已经安装的版本
  which       显示安装路径
```


python -c "import site; print(site.getsitepackages())"   // 查找 site-packages 目录的位置