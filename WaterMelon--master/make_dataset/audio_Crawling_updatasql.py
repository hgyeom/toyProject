# -*- coding: utf-8 -*-
"""
Created on Wed Sep 15 13:19:51 2021

@author: 726
"""

import pymysql
import csv

#mysql에 호스트ip 와 아이디 비밀번호를 입력해주고 어느 데이터베이스를 기준으로 쓸건지를 정해준다.
conn = pymysql.connect(host='127.0.0.1',user='root',password='ezen',db='watermelon',charset='utf8')


# "pip install pymysql"을 해주면 cursor()라는 메소드가 생기는데 매소드를 실행시켜 
# mysql에 연결시키는 작업이다.
curs = conn.cursor()


# sql = "select * from userinfo"

# # execute() 메서드를 사용하여 SQL 문장을 DB 서버에 보낸다.
# # fetchall()는 읽어오는 코드이다.
# curs.execute(sql)
# rows=curs.fetchall()

# print(rows)

file = open("C:/Users/726/Desktop/getdataset (2)/getdataset/audio_Crawling.csv","r",encoding="utf8")
print("파일을 읽어온다")
datas = csv.reader(file)
for line in datas :
    # print("읽어온 파일을 배열 처리한다")
    #csv파일을 라인을 하나씩 따서 저장을 해준다.
    mno         = (line[0])
    singer      = (line[1])
    album       = (line[4])
    releasedate = (line[5])
    genre       = (line[6])
    url         = (line[7])
    title       = (line[3])
    bpm         = (line[8])
    ptime       = (line[9])
    sql = "insert ignore into musicinfo (mno,singer,album,redate,genre,img_url,title,bpm,ptime) values (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
    print(sql)
    curs.execute(sql,(mno,singer,album,releasedate,genre,url,title,bpm,ptime))
    print(sql)
    conn.commit()
    continue
file.close()


