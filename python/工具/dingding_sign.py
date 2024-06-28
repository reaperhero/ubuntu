#!python3
import subprocess
import time
import hmac
import hashlib
import base64
from urllib import parse
import requests
import os

cmd = "docker inspect notification|awk -F '[:\" ,]+' '/RestartCount/{print $3}'"
filename = "/root/count.txt"


def write_old_count(new_sum):
    f = open(filename, 'w')
    f.write(str(new_sum))
    f.close()


def read_count():
    if not os.path.exists(filename):
        os.system(r"touch {}".format(filename))
        return 0
    if not os.path.getsize(filename):
        return 0
    f = open(filename, 'r')
    result = int(f.read())
    return int(result)


# https://developer.aliyun.com/article/999042
def send_ding():
    # secret = 'SEC45b11425097210f9a396d07cb929e3547fe7bef9586ccfb49d8651804e1efa6b'
    # url = "https://oapi.dingtalk.com/robot/send?access_token=0733281e8a948bb044fadf817e9562e769f9c637cc08112cc6ab5636d3259215"
    url = "https://oapi.dingtalk.com/robot/send?access_token=b9a9e8f5164f56b6eef522d59758f3a2160ea6d00357dc889851c199fe8151e1"
    secret = "SEC98ed0adaab0836c056341c7502ffab22abe56b0a1bd506d160bef75ac7c12c5d"
    # 把timestamp+"\n"+密钥当做签名字符串，使用HmacSHA256算法计算签名，然后进行Base64 encode
    # 最后再把签名参数再进行urlEncode，得到最终的签名（需要使用UTF-8字符集）
    timestamp = round(time.time() * 1000)

    secret_enc = secret.encode('utf-8')
    # 把timestamp+"\n"+密钥当做签名字符串
    string_to_sign = '{}\n{}'.format(timestamp, secret)
    string_to_sign_enc = string_to_sign.encode('utf-8')
    # 使用HmacSHA256算法计算签名
    hmac_code = hmac.new(secret_enc, string_to_sign_enc, digestmod=hashlib.sha256).digest()
    # 进行Base64 encode把签名参数再进行urlEncode
    sign = parse.quote(base64.b64encode(hmac_code))

    webhook = url + '&timestamp=%s&sign=%s' \
              % (timestamp, sign)
    playload_text = {
        "msgtype": "text",
        "text": {
            "content": "notification 重启了 [二哈]"
        },
        "at": {
            "atMobiles": ["18258539551"],
            "isAtAll": False
        }
    }
    r = requests.post(webhook, json=playload_text)


def check_result():
    output = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    new_out = output.stdout.replace("\n", "")
    return int(new_out)



if __name__ == '__main__':
    old_sum = read_count()
    new_sum = check_result()
    if new_sum > old_sum:
        send_ding()
        write_old_count(new_sum)
    else:
        write_old_count(new_sum)