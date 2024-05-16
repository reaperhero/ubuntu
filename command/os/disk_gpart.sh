#!/bin/bash

# 新增磁盘

[root@em ~]# blkid
/dev/vda1: UUID="c8ce9e8f-926b-4df7-beb4-014cdd5d9825" TYPE="xfs" 
/dev/vda2: UUID="539de362-54a8-46e3-a01d-f3a9b3b9fb59" TYPE="xfs" 
[root@em ~]# mkfs.xfs -f /dev/vdb
meta-data=/dev/vdb               isize=512    agcount=4, agsize=6553600 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0, sparse=0
data     =                       bsize=4096   blocks=26214400, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=12800, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
[root@em ~]# mkdir /data/nfs
[root@em ~]# mount -t xfs  /dev/vdb /data/nfs
[root@em ~]# vim /etc/fstab
/dev/vdb /data/nfs                         xfs     defaults        0 0
[root@em ~]# blkid    # 查看磁盘文件格式类型
/dev/vda1: UUID="c8ce9e8f-926b-4df7-beb4-014cdd5d9825" TYPE="xfs" 
/dev/vda2: UUID="539de362-54a8-46e3-a01d-f3a9b3b9fb59" TYPE="xfs" 
/dev/vdb: UUID="d9eff49a-0f00-4e15-a7ba-82a01871df17" TYPE="xfs" 



# aliyun
# https://help.aliyun.com/document_detail/111738.html?spm=a2c4g.11186623.6.793.6c997f67GH2j0j
# 扩容磁盘
apt install cloud-guest-utils
apt install xfsprogs
LANG=en_US.UTF-8
growpart /dev/vda 1
resize2fs /dev/vda1   # 针对文件系统ext2 ext3 ext4,
xfs_growfs /data/nfs  # 针对文件系统xfs    命令后面跟的是磁盘的挂载点，而不是磁盘的设备名称





