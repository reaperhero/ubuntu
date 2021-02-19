#!/bin/bash


find . -name "*" | xargs -i cp {} /home/users/    # 把查询到的文件 都copy到/home/users/中去

find /var/lib/docker/containers -type f -name "*-json.log"|xargs -I files sh -c 'echo "" > $1' -- files  # 清空文件
find ./ -type f -mmin -20 -name "*INFO_log*"|xargs grep  'a755d4'   # 过过滤文件

find logs/ -type f -mtime +7 -exec rm -f {} \; # 查找更改时间在7日以前的文件并删除
find logs/ -type f -mtime -7 -exec rm -f {} \; # 查找更改时间在7日以内的文件并删除

find -name april*                     #   在当前目录下查找以april开始的文件
find -name april* fprint file         #   在当前目录下查找以april开始的文件，并把结果输出到file中
find -name ap* -o -name may*          #   查找以ap或may开头的文件
find /mnt -name tom.txt -ftype vfat   # 在/mnt下查找名称为tom.txt且文件系统类型为vfat的文件
find /mnt -name t.txt ! -ftype vfat   # 在/mnt下查找名称为tom.txt且文件系统类型不为vfat的文件
find /tmp -name wa* -type l           # 在/tmp下查找名为wa开头且类型为符号链接的文件
find /home -mtime -2                 # 在/home下查最近两天内改动过的文件
find /home -atime -1                  # 查1天之内被存取过的文件
find /home -mmin    +60                #   在/home下查60分钟前改动过的文件
find /home -amin   +30                 #  查最近30分钟前被存取过的文件
find /home -newer   tmp.txt           #   在/home下查更新时间比tmp.txt近的文件或目录
find /home -anewer   tmp.txt          #   在/home下查存取时间比tmp.txt近的文件或目录
find /home -used -2                  #  列出文件或目录被改动过之后，在2日内被存取过的文件或目录
find /home -user cnscn                #  列出/home目录内属于用户cnscn的文件或目录
find /home -uid   +501                  #  列出/home目录内用户的识别码大于501的文件或目录
find /home -group   cnscn              #  列出/home内组为cnscn的文件或目录
find /home -gid 501                    #  列出/home内组id为501的文件或目录
find /home -nouser                     #  列出/home内不属于本地用户的文件或目录
find /home -nogroup                    #  列出/home内不属于本地组的文件或目录
find /home -name tmp.txt -maxdepth   4  #  列出/home内的tmp.txt 查时深度最多为3层
find /home -name tmp.txt -mindepth   3   #   从第2层开始查
find /home -empty                       #  查找大小为0的文件或空目录
find /home -size +512k                  #  查大于512k的文件
find /home -size -512k                  #  查小于512k的文件
find /home -links   +2                  #  查硬连接数大于2的文件或目录
find /home -perm   0700                 #  查权限为700的文件或目录

find / -amin -10        # 查找在系统中最后10分钟访问的文件
find / -atime -2        # 查找在系统中最后48小时访问的文件
find / -empty           # 查找在系统中为空的文件或者文件夹
find / -group   cat     # 查找在系统中属于group cat的文件
find / -mmin -5         # 查找在系统中最后5分钟里修改过的文件
find / -mtime -1        #查找在系统中最后24小时里修改过的文件
find / -nouser          #查找在系统中属于作废用户的文件
find / -user    fred    #查找在系统中属于FRED这个用户的文件


