#!/bin/bash
KUBERNETES_USED_SORT=$1
case ${KUBERNETES_USED_SORT} in
1)
    kubernete=`df -h|grep -i "kubernete"|sort -nrk 5 -nrk 2|awk -F "[ %]+" 'NR==1{print $(NF-1)}'`
    if [ ! ${kubernete} ]
    then
        echo 0
    else
        echo ${kubernete}
    fi
    ;;
2)
    kubernete=`df -h|grep -i "kubernete"|sort -nrk 5 -nrk 2|awk -F "[ %]+" 'NR==2{print $(NF-1)}'`
    if [ ! ${kubernete} ]
    then
        echo 0
    else
        echo ${kubernete}
    fi
    ;;
3)
    kubernete=`df -h|grep -i "kubernete"|sort -nrk 5 -nrk 2|awk -F "[ %]+" 'NR==3{print $(NF-1)}'`
    if [ ! ${kubernete} ]
    then
        echo 0
    else
        echo ${kubernete}
    fi
    ;;
*)
    echo "0"
    ;;
esac

