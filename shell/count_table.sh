#!/bin/bash
export MYSQL_HOST=10.171.195.61
export MYSQL_USER=root
export MYSQL_PWD=OoGhai6m
export MYSQL_DB=mudutv_analysis


# 导表结构
mysqldump -h ${MYSQL_HOST}  --opt -d ${MYSQL_DB} -u ${MYSQL_USER} -p${MYSQL_PWD} > /tmp/tablesstuct.sql

# 导表数据
tables=(`mysql -s ${MYSQL_DB} -h ${MYSQL_HOST}  -u ${MYSQL_USER} -p${MYSQL_PWD}  -e "show tables;" 2>/dev/null|grep -v 'Tables_in'`)


for table in ${tables[@]};
do
    countrow=`mysql -s ${MYSQL_DB} -h ${MYSQL_HOST}  -u ${MYSQL_USER} -p${MYSQL_PWD}  -e "select count(*) from ${table};" 2>/dev/null|tail -1`

    echo ${table}---${countrow}

    if [ $countrow -lt 800 ]
    then
        mysqldump -h ${MYSQL_HOST}  -u ${MYSQL_USER} -p${MYSQL_PWD} ${MYSQL_DB} ${table} 2>/dev/null >> /tmp/tablesdata.sql
    fi
done


arraytables=(drop_tbl mudutv-charge_inflow mudutv-charge_outflow mudutv-daily_add_channel mudutv-daily_login mudutv-daily_online_charge mudutv-daily_register mudutv-daily_time_billing mudutv-daily_transfer_billing mudutv-daily_upstream_times mudutv-daily_watch_time mudutv-first_bill_ids mudutv-first_billing_gt_100 mudutv-first_billing_num mudutv-mobile_daily_login mudutv-mobile_daily_register mudutv-phone_code_analysis mudutv-stream_event_call_times mudutv-topic_message mudutv-unique_login mudutv-user_messages)

for table in ${arraytables[@]};
do
<<<<<<< HEAD
    mysqldump --column-statistics=0 -h localhost -uroot -p123456 rank  ${table} >> /tmp/data.sql
done
=======
    mysqldump --column-statistics=0 -h 127.0.0.1 -uroot -p123456 rank  ${table} >> /tmp/data.sql
done
>>>>>>> d931550b6a67157f81e7baa2f021135f5536b49c
