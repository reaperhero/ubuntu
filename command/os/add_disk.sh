#!/bin/bash

# aliyun
# https://help.aliyun.com/document_detail/111738.html?spm=a2c4g.11186623.6.793.6c997f67GH2j0j
apt install cloud-guest-utils
apt install xfsprogs
LANG=en_US.UTF-8
growpart /dev/vda 1
resize2fs /dev/vda1