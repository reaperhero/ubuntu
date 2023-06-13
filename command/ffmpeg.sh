apt-get install software-properties-common -y
echo | add-apt-repository ppa:jonathonf/ffmpeg-4
apt-get update
apt-get install ffmpeg -y
ffmpeg -version



#!/bin/bash

# ubuntu
apt-get install software-properties-common -y
echo | add-apt-repository ppa:jonathonf/ffmpeg-4
apt-get update
apt-get install ffmpeg -y
ffmpeg -version


# centos
yum install epel-release
rpm -v --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
yum install ffmpeg ffmpeg-devel




# use
ffmpeg -i "" -c copy "测试.mp4"
ffmpeg -i "" -c copy -bsf:a aac_adtstoasc "jzm5rh13.flv"
ffmpeg -re -i 测试.mp4 -vcodec copy -acodec copy -b:v 800k -b:a 32k -f flv ""         
./ffmpeg -i http://10.35.0.40:1640/live/live875c812b3d7648c4b721d4bb9dade6bc_mp4_512/playlist.m3u8 -acodec copy -vcodec copy -f flv rtmp://61.141.193.170/live/u8c93j?auth_key=2082733261-0-0-b511168a488f92e13da990c896f130fa
ffmpeg  -re -stream_loop -1 -i ./8566rv75-1561711041-t.flv -vcodec libx264 -x264-params "nal-hrd=cbr"  -b:v 20M -minrate 20M -maxrate 20M -bufsize 40M -c:a copy -f flv ""