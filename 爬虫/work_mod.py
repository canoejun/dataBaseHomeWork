import urllib.request
import urllib.parse
import re

#获取网页的源码
def get_content():
    #网址
    url = 'https://xiaoyuan.zhaopin.com/full/0/0_0_0_0_0_0_0_1_0'
    #打开网址
    a = urllib.request.urlopen(url)
    #读取源代码并转为unicode
    html = a.read().decode('utf-8')
    return html

#正则匹配要爬取的内容
def get(html):
    #正则匹配式
    reg = re.compile(r'class="searchResultJobName.*?">.*?<a target="_blank" joburl href="//(.*?)" class="fl __ga__fullResultcampuspostname_clicksfullresultcampuspostnames_001">(.*?)</a>.*?<p class="searchResultCompanyname"><span>(.*?)</span>.*?<span>城市：<em class="searchResultJobCityval">(.*?)</em></span>.*?<span>发布时间：<em></em>(.*?)</span>.*?<span>招聘人数：<em>(.*?)</em></span>.*?职责描述：<span>(.*?)</span>',re.S)
    #进行匹配
    items = re.findall(reg,html)
    print(items)
    #计算匹配到的数目（一整条记录算一个）
    return items

items= get(get_content())

def work_data():
    return items
