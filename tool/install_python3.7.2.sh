#!/bin/bash
# auto instal python3.7.2
echo "=============================================="
python -V
echo "python3.7.2安装脚本开始运行......."
echo "本地上传请用Python-3.7.2.tgz包,不要用ASICC方式，目录下不要有python相关标识符"
echo "=============================================="
tarxzfile=`ls -l|grep Python-3.7.2|wc -l`
if [ ${tarxzfile} = 1 ]
then
    tar -zxvf Python-3.7.2.tgz
else
    wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz
    tar -zxvf Python-3.7.2.tgz
fi

cd Python-3.7.2
mkdir /usr/local/python3
./configure --prefix=/usr/local/python3
make && make install
rm -f /usr/bin/python

ln -s /usr/local/python3/bin/python3 /usr/bin/python3
echo "=============================================="
python -V
echo "python2 使用python2"
echo "python3使用python or python3"
echo "python3.7.2安装脚本安装完成.......注意不要链接python3给/usr/bin/python"
echo "=============================================="
