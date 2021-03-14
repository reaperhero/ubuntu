#!/bin/bash

rsync -a source destination   # 目标目录destination如果不存在，rsync 会自动创建。destination/source
rsync -a source/ destination  # source里面的内容到目标目录destination

rsync -av --delete source/ destination # --delete参数，这将删除只存在于目标目录、不存在于源目录的文件。

rsync -av --exclude='*.txt' source/ destination # 排除了所有 txt
rsync -av --exclude=".*" source/ destination # 排除隐藏文件

rsync -av --exclude 'dir1/*' source/ destination # 排除某个目录里面的所有文件，但不希望排除目录本身

rsync -av source/ username@remote_host:destination # ssh 将本地同步到远程
rsync -av username@remote_host:source/ destination # ssh 将远程内容同步到本地

rsync -av source/ 192.168.122.32::module/destination # module是rsync守护的资源名