# apt-get install supervisor
# systemctl status supervisor
# supervisorctl status


[program:G89VZD]
command=ffmpeg -re -i "17235745.mp4" -vcodec copy -acodec copy -b:v 800k -b:a 32k -f flv "rtmp://122.112.205.92:1935/live/mxer2db5?authkey=1890020257-83e4fdc0996cbd5b57c9ec75910b289f"
directory=/root/
user =root
autostart=true
autorestart=true
startsecs=3
stderr_logfile=/var/log/supervisor/G89VZD.log
stdout_logfile=/var/log/supervisor/G89VZD.log
