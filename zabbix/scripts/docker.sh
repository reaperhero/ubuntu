#!/bin/bash
DOCKER_USED_SORT=$1
case ${DOCKER_USED_SORT} in
1)
    DOCKER_USED_Percent=`df -h|grep -i "docker"|sort -nrk 5 -nrk 2|awk -F "[ %]+" 'NR==1{print $(NF-1)}'`
    if [ ! ${DOCKER_USED_Percent} ]
    then
        echo 0
    else
        echo ${DOCKER_USED_Percent}
    fi
    ;;
2)
    DOCKER_USED_Percent=`df -h|grep -i "docker"|sort -nrk 5 -nrk 2|awk -F "[ %]+" 'NR==2{print $(NF-1)}'`
    if [ ! ${DOCKER_USED_Percent} ]
    then
        echo 0
    else
        echo ${DOCKER_USED_Percent}
    fi
    ;;
3)
    DOCKER_USED_Percent=`df -h|grep -i "docker"|sort -nrk 5 -nrk 2|awk -F "[ %]+" 'NR==3{print $(NF-1)}'`
    if [ ! ${DOCKER_USED_Percent} ]
    then
        echo 0
    else
        echo ${DOCKER_USED_Percent}
    fi
    ;;
*)
    echo "0"
    ;;
esac
