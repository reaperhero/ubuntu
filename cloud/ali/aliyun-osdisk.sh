#!/bin/bash
# https://help.aliyun.com/document_detail/111738.html?spm=a2c4g.11186623.6.802.17d11b25JIOnFn
apt update
apt install cloud-guest-utils -y
apt-get install cloud-guest-utils -y
apt install xfsprogs -y
growpart /dev/vda 1
resize2fs /dev/vda1