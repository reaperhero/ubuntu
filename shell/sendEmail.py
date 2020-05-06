#!/usr/local/bin/python3
import smtplib
from email.header import Header
from email.mime.text import MIMEText
 
# 第三方 SMTP 服务
mail_host = "smtphm.qiye.163.com"      # SMTP服务器
mail_user = "chenqiangjun@mudu.tv"                  # 用户名
mail_pass = "kXvWvw4kKGVsJWSR"               # 授权密码，非登录密码
 
sender = "chenqiangjun@mudu.tv"    # 发件人邮箱(最好写全, 不然会失败)
receivers = ['chenqiangjun@mudu.tv']  # 接收邮件，可设置为你的QQ邮箱或者其他邮箱
 
content = '我用Python'
title = '人生苦短'  # 邮件主题
 
def sendEmail():
 
    message = MIMEText(content, 'plain', 'utf-8')  # 内容, 格式, 编码
    message['From'] = "{}".format(sender)
    message['To'] = ",".join(receivers)
    message['Subject'] = title
 
    try:
        smtpObj = smtplib.SMTP_SSL(mail_host, 465)  # 启用SSL发信, 端口一般是465
        smtpObj.login(mail_user, mail_pass)  # 登录验证
        smtpObj.sendmail(sender, receivers, message.as_string())  # 发送
        print("mail has been send successfully.")
    except smtplib.SMTPException as e:
        print(e)

 
if __name__ == '__main__':
    sendEmail()
