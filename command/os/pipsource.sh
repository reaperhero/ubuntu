vim /root/.pip/pip.conf

[global]
index-url = http://mirrors.aliyun.com/pypi/simple/
trusted-host = mirrors.aliyun.com


pip3 install astroid==2.3.1
pip3 install grpcio
pip3 install -r requirement.txt --trusted-host mirrors.aliyun.com
