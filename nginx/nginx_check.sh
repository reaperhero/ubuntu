#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

nginxProcess=`service nginx status|grep "nginx:.*process"|wc -l`
nginxStatus=`service nginx status|grep "nginx:.*process"`

function SendMessageToDingding(){
    Dingding_Url="钉钉机器人url"
    curl "${Dingding_Url}" -H 'Content-Type: application/json' -d "
    {
        'msgtype': 'text',
        'text': {
            'content': 'nginx is problem please login: ssh ubuntu@162.14.10.161  $QFwEQhJ@%6Fn&PA'
        },
        'at': {
            'isAtAll': true
        }
    }"
}

if [ $nginxProcess -eq 3 ]
then
        echo $nginxStatus >>/tmp/nginxStatus.log
    echo $nginxProcess >> /tmp/nginxProcess.log
else
    echo $nginxStatus >>/tmp/nginxStatus.log
    echo $nginxProcess >> /tmp/nginxProcess.log
    SendMessageToDingding
fi

# dateStr=`date -d "1 minute ago"  +%e/%b/%G:%H:%M`
# errcount=`tail -300 /var/log/nginx/access.log |grep $dateStr|grep"HTTP/1.1\" 5[0-9][0-9]"|wc -l`


# function SendMessageToDingding(){
#     Dingding_Url="钉钉机器人url"
#     curl "${Dingding_Url}" -H 'Content-Type: application/json' -d "
#     {
#         'msgtype': 'text',
#         'text': {
#             'content': 'nginx appear 502 please login: ssh ubuntu@162.14.10.161  $QFwEQhJ@%6Fn&PA'
#         },
#         'at': {
#             'isAtAll': true
#         }
#     }"
# }

# if [ $errcount -eq 0 ]
# then
#     echo "$dateStr nginx normal" >> /tmp/nginx_access.log
# else
#     echo "$dateStr nginx fail" >> /tmp/nginx_access.log
#     SendMessageToDingding
# fi


