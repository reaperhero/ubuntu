#!/bin/bash
wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1604-4.2.8.tgz 
tar -zxvf mongodb-linux-x86_64-ubuntu1604-4.2.8.tgz
mv mongodb-linux-x86_64-ubuntu1604-4.2.8 /usr/local/mongodb4
# export PATH=/usr/local/mongodb4/bin:$PATH
cd /usr/local/mongodb4/bin