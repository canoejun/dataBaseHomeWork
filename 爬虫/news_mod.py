# 虽然网页源码里有feed-card-item类，但是实际上找不到这个类，是因为他
# 是通过JavaScript动态生成的，不在静态HTML页面，所以通过访问下面的那个URL来捕获
# 也就是说，该网页并不是一次加载出全部资源，而是动态加载资源

import requests
import json
import urllib.request
import re


url = "https://feed.sina.com.cn/api/roll/get?pageid=121&lid=1356&num=20&versionNumber=1.2.4&page=1&encode=utf-8&callback=feedCardJsonpCallback&_=1540471652371"
res = requests.get(url).text
res = res.rstrip("tch(e){};")
res = res.rstrip(";}ca")
res = res.rstrip(")")
res = res.lstrip("try{feedCardJsonpCallback")
res = res.lstrip("(")
jso = json.loads(res)

def getpic(url):
    # 打开网址
    a = urllib.request.urlopen(url)
    # 读取源代码并转为unicode
    html = a.read().decode('utf-8')
    reg = re.compile(r'<div class="img_wrapper"><img.*?src="(.*?)" alt="',re.S)
    # 进行匹配
    items = re.findall(reg, html)
    if (not items):
        return ""
    else:
        picurl = items[0]
        return picurl


def news_data():
    return   jso["result"]["data"]


