#!/bin/bash
ss_status=$1
case ${ss_status} in
ESTAB)
    ss_count=`ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i ESTAB|wc -l`
    if [ ${ss_count} == 0 ]
    then
        echo 0
    else
        echo `ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i ESTAB|awk '{print $2}'`
    fi
    ;;
SYN-SENT)
    ss_count=`ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i SYN-SENT|wc -l`
    if [ ${ss_count} == 0 ]
    then
        echo 0
    else
        echo `ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i SYN-SENT|awk '{print $2}'`
    fi
    ;;
SYN-RECV)
    ss_count=`ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i SYN-RECV|wc -l`
    if [ ${ss_count} == 0 ]
    then
        echo 0
    else
        echo `ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i SYN-RECV|awk '{print $2}'`
    fi
    ;;
FIN-WAIT-1)
    ss_count=`ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i FIN-WAIT-1|wc -l`
    if [ ${ss_count} == 0 ]
    then
        echo 0
    else
        echo `ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i FIN-WAIT-1|awk '{print $2}'`
    fi
    ;;
FIN-WAIT-2)
    ss_count=`ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i FIN-WAIT-2|wc -l`
    if [ ${ss_count} == 0 ]
    then
        echo 0
    else
        echo `ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i FIN-WAIT-2|awk '{print $2}'`
    fi
    ;;
TIME-WAIT)
    ss_count=`ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i TIME-WAIT|wc -l`
    if [ ${ss_count} == 0 ]
    then
        echo 0
    else
        echo `ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i TIME-WAIT|awk '{print $2}'`
    fi
    ;;
CLOSED)
    ss_count=`ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i CLOSED|wc -l`
    if [ ${ss_count} == 0 ]
    then
        echo 0
    else
        echo `ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i CLOSED|awk '{print $2}'`
    fi
    ;;
CLOSE-WAIT)
    ss_count=`ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i CLOSE-WAIT|wc -l`
    if [ ${ss_count} == 0 ]
    then
        echo 0
    else
        echo `ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i CLOSE-WAIT|awk '{print $2}'`
    fi
    ;;
LAST-ACK)
    ss_count=`ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i LAST-ACK|wc -l`
    if [ ${ss_count} == 0 ]
    then
        echo 0
    else
        echo `ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i LAST-ACK|awk '{print $2}'`
    fi
    ;;
LISTEN)
    ss_count=`ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i LISTEN|wc -l`
    if [ ${ss_count} == 0 ]
    then
        echo 0
    else
        echo `ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i LISTEN|awk '{print $2}'`
    fi
    ;;
CLOSING)
    ss_count=`ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i CLOSING|wc -l`
    if [ ${ss_count} == 0 ]
    then
        echo 0
    else
        echo `ss -ant | awk '{++s[$1]} END {for(k in s) print k,s[k]}'|grep -i CLOSING|awk '{print $2}'`
    fi
    ;;
*)
    echo "Please use /etc/zabbix/scripts/netstat.sh ESTAB|SYN-SENT|SYN-RECV|FIN-WAIT-1|FIN-WAIT-2|TIME-WAIT|CLOSED|CLOSE-WAIT|LAST-ACK|LISTEN|CLOSING"
    ;;
esac
