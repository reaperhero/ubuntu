# mdkir -p /var/log/.hist && chmod -R 777 /var/log/.hist
export HISTTIMEFORMAT="[%Y%m%d-%H%M-:%S]"
export HISTSIZE=5000
export HISTDIR=/var/log/.hist
export USER_IP=`who -u am i 2>/dev/null| awk '{print$NF}'|sed -e 's/[()]//g'`
export DT=`date +%Y%m%d_%H%M%S`
export HISTFILE="$HISTDIR/${LOGNAME}-${USER_IP}.hist.$DT"