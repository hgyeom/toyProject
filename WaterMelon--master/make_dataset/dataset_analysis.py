# -*- coding: utf-8 -*-
"""
작성자 두성수

1. 데이터셋을 가져와서 데이터 전처리
2. 전처리를 한 데이터를 가지고 코사인 비교를 하여 데이터유사도를 비교
3. 파일을 열어 안에 있는 노래파일로 가져와 데이터 프레임으로 작성후 csv에 저장
4. csv 저장할때 mode="a"를 사용하여 덮어쓰기로 한다.
"""

import os
import pandas as pd
from sklearn.metrics.pairwise import cosine_similarity
import sklearn
import csv

"""
데이터의 전처리
"""
# csv 파일의 데이터를 가져온다.
df_30 = pd.read_csv('audio.csv', index_col='filename',encoding='utf8')
# print(df_30)

# 라벨을 지정해서 가져온다.
labels = df_30[['label']]
# print("label 타입 실행")
# print(labels)

# 특정한 컬럼을 제외 하기 위해서 쓰는 코드
df_30 = df_30.drop(columns=['length', 'label'])
# print(df_30)

# 데이터를 전처리 하기 위한 코드
# sklearn 에서 minmaxscaler 사용하여 값 0~1사이로 조정
df_30_scaled = sklearn.preprocessing.scale(df_30)
# print("데이터 전처리")
# print(df_30_scaled)

# 전처리한 데이터를 추가한다.
df_30 = pd.DataFrame(df_30_scaled, columns=df_30.columns)
# print(df_30)

# 전처리한 데이터를 가져와서 코사인 유사도를 구하는 코드
"""
코사인 각도를 이용하여 구할 수 있는 두 벡터의 유사도를 의미이며
코사인 유사도는 -1~1까지의 유사도를 가지고 나누는 코드이며
1에 가까울수록 유사한 것으로 생각할수 있다.
"""
similarity = cosine_similarity(df_30)
# print(similarity)

# 코사인 유사도를 위해 만든 데이터를 데이터 프레임에 쓰는 작업이다.
sim_df = pd.DataFrame(similarity, index=labels.index, columns=labels.index)
# print(sim_df)


# 함수화 진행

def find_similar_songs(name):
    
    # 전처리 한 데이터를 함수화(등록된)값을 가져와서 분석
    series = sim_df[name].sort_values(ascending=False)
    
    # 본인(등록한)값을 제하기 위한 드랍
    series = series.drop(name)
    # print(series)
    return series.to_frame()


"""
f = open("audio.csv", "r",encoding='utf8')
reader = csv.reader(f)
next(reader)
# print(reader)
for row in reader:
    print(row[0])
    print(reader)

    print(find_similar_songs(row[0]))
    data = pd.DataFrame(find_similar_songs(row[0]))
    data.to_csv('D:\\음악번호\\getdataset\\audio_Ranking\\'+str(row[0])+'.csv', mode='w')
"""
print(find_similar_songs("4262252.wav"))

