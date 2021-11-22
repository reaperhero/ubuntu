#!/bin/bash

/foo\c           # 大小写不敏感查找
/foo\C           # 大小写敏感查找

在normal模式下按下*即可查找光标所在单词（word）

:%s/foo/bar/g       # 在全局范围(%)查找foo并替换为bar
:5,12s/foo/bar/g    # 2-11行范围替换
:.,+2s/foo/bar/g    # 当前行与接下来2行
 