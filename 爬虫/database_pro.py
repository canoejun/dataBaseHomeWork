import pymysql
import re
# import urllib.request


import news_mod
import work_mod

# 链接数据库
conn = pymysql.connect(host='127.0.0.1',user='root',passwd='jun123',db='info_manage',port=3306,charset='utf8')

print("打印数据库链接对象{}".format(conn))
# 获取游标
cur = conn.cursor()
#-------------------------------------part1-新闻模块--------------------------------------------------------------------
cur.execute("drop table if EXISTS  news")
sql="""create table news (
      title VARCHAR(500) NOT NULL  PRIMARY KEY,
      time VARCHAR(500),
      media VARCHAR(500),
      url VARCHAR(700),
      pic VARCHAR(700)
    )"""
cur.execute(sql)
#cur.execute(sql) 这个只是执行了你 sql 中的语句，如果对表进行了修改 只执行这一句并没有作用，
#需要在后面加上conn.commit()提交增删改数据到数据库

#添加数据
try:
    for i in news_mod.news_data():
        # print(i["title"], "-", i["url"], i["media_name"])
        title = i["title"]
        print(title)
        url = i["url"]
        print(url)
        time = re.findall(r'[0-9].*-.*-[0-9][0-9]',url)

        pic_url = news_mod.getpic(url)
        print(pic_url)
        time2 = time[0]
        print(time[0])


        print(type(time2))

        media_name = i["media_name"]
        print(media_name)

        value = "'" + title + "','" + time2 + "','" + media_name + "','" + url + "','" + pic_url + "')"
        print('valus='+value)
        sql = "insert into news(title,time,media,url,pic)values(" + value
        print(sql)
        # 执行sql语句
        cur.execute(sql)
        # 提交到数据库执行
        conn.commit()
except:
    #发生错误时回滚
    conn.rollback()

#--------------------------------part2-工作模块------------------------------------------------------------------------

cur.execute("drop table if EXISTS  works")
sql="""create table works (
      url VARCHAR(500) NOT NULL  PRIMARY KEY,
      work VARCHAR(500),
      company VARCHAR(500),
      city VARCHAR(500),
      time VARCHAR(500),
      recruits_number VARCHAR(500),
      request VARCHAR(500)
    )"""
cur.execute(sql)

try:
    for item in work_mod.work_data():
        url = item[0]
        work = item[1]
        company = item[2]
        city = item[3]
        time = item[4]
        recruits_number = item[5]
        request = item[6]

        value = "'" + url + "','" + work + "','" + company + "','" + city + "','" + time + "','" + recruits_number + "','" + request +  "')"
        sql = "insert into works(url,work,company,city,time,recruits_number,request)values(" + value
    # 执行sql语句
        cur.execute(sql)
    # # #提交到数据库执行
        conn.commit()
except:
    #发生错误时回滚
    conn.rollback()
