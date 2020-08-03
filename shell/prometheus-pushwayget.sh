#!/bin/bash
export instance="mudutv-web01"
export datemin=`date -d "1 minute ago"  +%e/%b/%G:%H:%M`

function send_to_pushgateway()
{
    result=`curl -XPOST --data-binary @/tmp/nginx_user_request_count.txt http://192.168.0.1:31098/metrics/job/mudutv_aliyun_nginx/instance/${instance}`
    echo $resut
    if [ $? -eq 0 ]
    then
      echo "发送成功"
    else
      echo "发送失败"
    fi
}

function slow_nginx_log_second_0()
{
    tail -40000 /var/www/log/mudutv/access.log|grep $datemin|awk -F '[= ]+' '{ if ( $(NF-4) < 1 && $7 !~ /dataapi/ ) print $7 }'|sort |uniq -c|sort -n|tail -20|head -19 | while read info
do
    elements=(${info})
    element1=${elements[0]}
    element2=${elements[1]}
    echo $element1 $element2
    printf "nginx_user_request_time{tags=\"mudutv.aliweb\",request_time=\"0\",request_url=\"%s\"} %s\n"  ${element2} ${element1} >> /tmp/nginx_user_request_count.txt
done

}

function slow_nginx_log_second_1()
{
    tail -40000 /var/www/log/mudutv/access.log|grep $datemin|awk -F '[= ]+' '{ if ( $(NF-4) > 1 &&  $(NF-4) <2  && $7 !~ /dataapi/ ) print $7 }'|sort |uniq -c|sort -n|tail -20|head -19 | while read info
do
    elements=(${info})
    element1=${elements[0]}
    element2=${elements[1]}
    echo $element1 $element2
    printf "nginx_user_request_time{tags=\"mudutv.aliweb\",request_time=\"1\",request_url=\"%s\"} %s\n"  ${element2} ${element1} >> /tmp/nginx_user_request_count.txt
done

}

function slow_nginx_log_second_2()
{
    tail -40000 /var/www/log/mudutv/access.log|grep $datemin|awk -F '[= ]+' '{ if ( $(NF-4) > 2 &&  $(NF-4) <3 && $7 !~ /dataapi/ ) print $7 }'|sort |uniq -c|sort -n|tail -20|head -19 | while read info
do
    elements=(${info})
    element1=${elements[0]}
    element2=${elements[1]}
    echo $element1 $element2
    printf "nginx_user_request_time{tags=\"mudutv.aliweb\",request_time=\"2\",request_url=\"%s\"} %s\n"  ${element2} ${element1} >> /tmp/nginx_user_request_count.txt
done

}


function slow_nginx_log_second_3()
{
    tail -40000 /var/www/log/mudutv/access.log|grep $datemin|awk -F '[= ]+' '{ if ( $(NF-4) > 3 &&  $(NF-4) < 4 && $7 !~ /dataapi/ ) print $7 }'|sort |uniq -c|sort -n|tail -20|head -19 | while read info
do
    elements=(${info})
    element1=${elements[0]}
    element2=${elements[1]}
    echo $element1 $element2
    printf "nginx_user_request_time{tags=\"mudutv.aliweb\",request_time=\"3\",request_url=\"%s\"} %s\n"  ${element2} ${element1} >> /tmp/nginx_user_request_count.txt
done

}

function slow_nginx_log_second_4()
{
    tail -40000 /var/www/log/mudutv/access.log|grep $datemin|awk -F '[= ]+' '{ if ( $(NF-4) > 4 &&  $(NF-4) < 5 && $7 !~ /dataapi/ ) print $7 }'|sort |uniq -c|sort -n|tail -20|head -19 | while read info
do
    elements=(${info})
    element1=${elements[0]}
    element2=${elements[1]}
    printf "nginx_user_request_time{tags=\"mudutv.aliweb\",request_time=\"4\",request_url=\"%s\"} %s\n"  ${element2} ${element1} >> /tmp/nginx_user_request_count.txt
done

}


function slow_nginx_log_second_5()
{
    tail -40000 /var/www/log/mudutv/access.log|grep $datemin|awk -F '[= ]+' '{ if ( $(NF-4) > 5 &&  $(NF-4) < 10 && $7 !~ /dataapi/ ) print $7 }'|sort |uniq -c|sort -n|tail -20|head -19 | while read info
do
    elements=(${info})
    element1=${elements[0]}
    element2=${elements[1]}
    echo $element1 $element2
    printf "nginx_user_request_time{tags=\"mudutv.aliweb\",request_time=\"5\",request_url=\"%s\"} %s\n"  ${element2} ${element1} >> /tmp/nginx_user_request_count.txt
done

}


function slow_nginx_log_second_10()
{
    tail -40000 /var/www/log/mudutv/access.log|grep $datemin|awk -F '[= ]+' '{ if ( $(NF-4) > 10 && $7 !~ /dataapi/ ) print $7 }'|sort |uniq -c|sort -n|tail -20|head -19 | while read info
do
    elements=(${info})
    element1=${elements[0]}
    element2=${elements[1]}
    echo $element1 $element2
    printf "nginx_user_request_time{tags=\"mudutv.aliweb\",request_time=\"10\",request_url=\"%s\"} %s\n"  ${element2} ${element1} >> /tmp/nginx_user_request_count.txt
done

}


function nginx_user_request_count()
{

    tail -40000 /var/www/log/mudutv/access.log|grep $datemin|awk -F '[ "]+' '{if($7 !~ /dataapi/ && $(NF-6) ~ /[0-9]+/ ) print $(NF-6)" " $7 "\n"}'|sort |uniq -c|sort -n|tail -20|head -19 | while read info
do
    elements=(${info})
    element1=${elements[0]}
    element2=${elements[1]}
    element3=${elements[2]}
    printf "nginx_user_request_count{tags=\"mudutv.aliweb\",ip=\"%s\",request_url=\"%s\"} %s\n" ${element2} ${element3}  ${element1} >> /tmp/nginx_user_request_count.txt
done

}

function init()
{
    cat /dev/null >/tmp/nginx_user_request_count.txt
}


function main()
{
    init
    nginx_user_request_count
    slow_nginx_log_second_0
    slow_nginx_log_second_1
    slow_nginx_log_second_2
    slow_nginx_log_second_3
    slow_nginx_log_second_4
    slow_nginx_log_second_5
    slow_nginx_log_second_10
    send_to_pushgateway
}

main