#!/bin/bash


创建物理卷
pvcreate /dev/vdb /dev/vdc
pvdisplay

创建卷组
vgcreate vgdata /dev/vdb /dev/vdc
vgdisplay

创建逻辑卷
lvcreate -L 15GB -n lvdata1 vgdata
lvdisplay

格式化
mkfs.ext4 /dev/vgdata/lvdata1
mkdir /Data1
mount /dev/vgdata/lvdata1 /Data1
blkid && UUID=c6a243ce-5150-41ac-8816-39db54d1a4b8 /Data1                  ext4    defaults        0 0

逻辑卷扩展
lvextend -L +4GB /dev/vgdata/lvdata1
resize2fs /dev/vgdata/lvdata1
xfs_growfs /dev/elastic/lvol0


pvcreate /dev/vde
vgextend minio /dev/vde
lvextend -l +100%FREE  /dev/minio/minio
resize2fs /dev/mapper/minio-minio