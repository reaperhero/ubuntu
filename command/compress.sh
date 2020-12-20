#!/bin/bash


# zip
zip -r filename.zip file1 file2 file3 /usr/work/school   # 压缩多个文件和目录
unzip filename.zip               # 解压

# rar
wget https://www.rarlab.com/rar/rarlinux-x64-6.0.0.tar.gz
tar -xzpvf rarlinux-x64-6.0.0.tar.gz
cd rar
make

rar a all *.jpg     # 将所有 .jpg 的文件压缩成一个 rar 包，名为 all.rar
unrar e all.rar     # 将 all.rar 中的所有文件解压出来

