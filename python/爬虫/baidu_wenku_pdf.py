# -*- coding:utf-8 -*-
# file_name      wk_baidu_spider
# time           2023/2/12 14:28


__author__ = 'charon'

from gevent import monkey
from gevent.pool import Pool
import os
import re
import sys
from PIL import Image
import gevent

monkey.patch_all()
import requests


def fetch_article_url(url):
    headers = {
        'Host': 'wenku.baidu.com',
        'Origin': 'http://www.wezhicms.com',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
    }
    content = requests.get(url, headers=headers).content.decode('utf-8')
    url_patten = r'htmlUrls":(.*)"freePage'
    match_obj = re.search(url_patten, content)
    if match_obj is not None:
        match_content = match_obj.group(1)
        end = match_content.rfind(',')
        match_content = match_content[:end]
        print(f'match_content={match_content}')
        match_content = match_content if match_content is not None else None
        url_list = eval(match_content)
        print(f'total find {len(url_list)}条记录')
        return url_list
    else:
        print(f'获取内容失败')
        return


def download_img(url_list, save_dir=None):
    if len(url_list) > 0:
        temp = url_list[0].split('?')[0]
        pos = temp.rfind('/')
        doc_id = temp[pos + 1:-5]
        cur_dir = os.getcwd()
        tmp_path = os.path.join(cur_dir, str(doc_id[:10]))
        save_dir = save_dir or tmp_path
        if not os.path.exists(save_dir):
            os.mkdir(save_dir)

        def send_request(url, path):
            file_name = f"{url.split('?')[-1].split('&')[0].split('=')[-1]}.jpg"
            abs_path = os.path.join(path, file_name)
            with open(abs_path, 'wb') as f:
                res = requests.get(url).content
                f.write(res)
                print(f'{file_name} 文件下载成功')

        pool = Pool(10)
        gevent.joinall([
            pool.spawn(send_request, url=url, path=tmp_path)
            for url in url_list]
        )

        print(f'文件下载成功, 位置在:{tmp_path} 文件夹下')
        return tmp_path
    else:
        print('url_list 为空')
        sys.exit(0)


def img_to_pdf(source_path, target_path=None):
    cur_dir = os.getcwd()
    tmp_path = os.path.join(cur_dir, 'target_pdf')
    target_path = target_path or tmp_path
    if not os.path.exists(target_path):
        os.mkdir(target_path)
    files = os.listdir(source_path)
    img_files = []
    sources = []
    for file in files:
        if 'png' or 'jpeg' in file:
            img_files.append(os.path.join(source_path, file))

    def sort_fun(val: str):
        file_name = os.path.split(val)[-1]
        key = int(file_name.split('.')[0])
        return key

    img_files.sort(key=sort_fun)
    output = Image.open(img_files[0])
    img_files.pop(0)
    print(f'img_files=={img_files}')
    for file in img_files:
        png_file = Image.open(file)
        if png_file.mode == "RGB":
            png_file = png_file.convert("RGB")
        sources.append(png_file)
    file_abs = os.path.join(target_path, 'merge_file.pdf')
    output.save(file_abs, save_all=True, append_images=sources)
    print(f'pdf文件合成成功,文件在:{target_path}目录下')
    return target_path


def run():
    url = input('请输入文库的链接地址:')
    url_reg = r'^https://wenku.baidu.com/view/.'
    flag = re.match(url_reg, url)
    if flag:
        pass
        url_list = fetch_article_url(url)
        file_dir = download_img(url_list)
        img_to_pdf(file_dir)
    else:
        print(f'输入的url网址有误,请重新输入')


if __name__ == '__main__':
    run()
