#!/bin/bash

# 文件copy
ansible group1 -m copy -a "src='/etc/fstab' dest='/tmp' mode='600'"