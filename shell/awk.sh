#!/bin/bash

awk -F ":" '$3==502{print $1}' /etc/passwd  # 检索用户ID值为502的用户名。