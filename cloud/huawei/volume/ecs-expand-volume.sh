#!/bin/bash
# https://support.huaweicloud.com/usermanual-evs/evs_01_0072.html

growpart /dev/vda 1
resize2fs /dev/vda1