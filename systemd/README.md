列出正在运行的 Unit
systemctl list-units

列出所有Unit，包括没有找到配置文件的或者启动失败的
systemctl list-units --all

列出所有没有运行的 Unit
systemctl list-units --all --state=inactive

列出所有加载失败的 Unit
systemctl list-units --failed

列出所有正在运行的、类型为 service 的 Unit
systemctl list-units --type=service