#!/bin/bash

# 文件copy
ansible youkehw -m copy -a "src='/etc/fstab' dest='/tmp' mode='600'"