# command



# 安装grpc
pip3 install grpcio
pip3 install protobuf
pip3 install grpcio-tools



# ubuntu14.04 安装python
# apt-get install openssl libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev -y
# https://www.jianshu.com/p/f8585da77ed9
wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz
tar -zxvf Python-3.7.2.tgz
cd Python-3.7.2
mkdir /usr/local/python3
./configure --prefix=/usr/local/python3 --with-openssl=/usr/local/openssl 
make && make install
ln -s /usr/local/python3/bin/python3 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package




