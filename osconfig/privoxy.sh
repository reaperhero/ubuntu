#!/bin/bash
if [ $1 -eq 1 ]
then
    sudo systemctl status privoxy
    tail -2 /etc/privoxy/config
    export http_proxy='http://127.0.0.1:8008'
    export https_proxy='https://127.0.0.1:8008'
    echo $http_proxy $https_proxy
    echo "代理已经开启"
else [ $1 -eq 2 ]
    sudo systemctl status privoxy
    unset http_proxy
    unset https_proxy
    echo $http_proxy $https_proxy
    echo "代理已经关闭"
fi
