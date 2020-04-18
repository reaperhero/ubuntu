#!/bin/bash
apt install default-jdk
wget https://mirror.olnevhost.net/pub/apache/tomcat/tomcat-9/v9.0.33/bin/apache-tomcat-9.0.33.zip
unzip apache-tomcat-9.0.33.zip
mv apache-tomcat-9.0.33 /usr/local/
echo "export CATALINA_HOME="/opt/tomcat/apache-tomcat-9.0.33"" >> ~/.bashrc
chmod +x  /usr/local/apache-tomcat-9.0.33/bin/*

useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
chown -RH tomcat: /usr/local/apache-tomcat-9.0.33/

cat > /etc/systemd/system/tomcat.service << EOF
[Unit]
Description=Tomcat 9 servlet container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/default-java"
Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom -Djava.awt.headless=true"

Environment="CATALINA_BASE=/usr/local/apache-tomcat-9.0.33/"
Environment="CATALINA_HOME=/usr/local/apache-tomcat-9.0.33/"
Environment="CATALINA_PID=/usr/local/apache-tomcat-9.0.33/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms4048M -Xmx4048M -server -XX:+UseParallelGC"

ExecStart=/usr/local/apache-tomcat-9.0.33/bin/startup.sh
ExecStop=/usr/local/apache-tomcat-9.0.33/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
EOF

systemctl start tomcat