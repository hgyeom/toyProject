import os
import librosa
import numpy as np
import pandas as pd
from os import listdir
from os.path import isfile, join
from bs4 import BeautifulSoup
import requests

path_dir = "D:\\no"
 
file_list = os.listdir(path_dir)
for file_list in file_list:
    try:
        print("Start Get Filename... ")
        print(file_list)
        pop                 = 'k-pop'
        songname            = file_list
        print("Start Music Analysis.... ")
        print("=================================")
        y, sr               = librosa.load(file_list)
        S                   = np.abs(librosa.stft(y))    
        tempo, beats        = librosa.beat.beat_track(y=y, sr=sr)
        chroma_stft         = librosa.feature.chroma_stft(y=y, sr=sr)
        chroma_cq           = librosa.feature.chroma_cqt(y=y, sr=sr)
        chroma_cens         = librosa.feature.chroma_cens(y=y, sr=sr)
        melspectrogram      = librosa.feature.melspectrogram(y=y, sr=sr)
        rms                 = librosa.feature.rms(y=y)
        cent                = librosa.feature.spectral_centroid(y=y, sr=sr)
        spec_bw             = librosa.feature.spectral_bandwidth(y=y, sr=sr)
        contrast            = librosa.feature.spectral_contrast(S=S, sr=sr)
        rolloff             = librosa.feature.spectral_rolloff(y=y, sr=sr)
        poly_features       = librosa.feature.poly_features(S=S, sr=sr)
        tonnetz             = librosa.feature.tonnetz(y=y, sr=sr)
        zcr                 = librosa.feature.zero_crossing_rate(y)
        harmonic            = librosa.effects.harmonic(y)
        percussive          = librosa.effects.percussive(y)
        mfcc                = librosa.feature.mfcc(y=y, sr=sr)
        mfcc_delta          = librosa.feature.delta(mfcc)
        onset_frames        = librosa.onset.onset_detect(y=y, sr=sr)
        frames_to_time      = librosa.frames_to_time(onset_frames[:20], sr=sr)
        
        
        frame_mean          = (id, np.mean(frames_to_time))  # frames
        frame_var           = (id, np.var(frames_to_time))
        tempo_vector        = (id, tempo)  # tempo
        total_beats         = (id, sum(beats))  # beats
        average_beats       = (id, np.average(beats))
        chroma_stft_mean    = (id, np.mean(chroma_stft))  # chroma stft
        chroma_stft_var     = (id, np.var(chroma_stft))
        chroma_cq_mean      = (id, np.mean(chroma_cq))  # chroma cq
        chroma_cq_var       = (id, np.var(chroma_cq))
        chroma_cens_mean    = (id, np.mean(chroma_cens))  # chroma cens
        chroma_cens_var     = (id, np.var(chroma_cens))
        mel_mean            = (id, np.mean(melspectrogram))  # melspectrogram
        mel_var             = (id, np.var(melspectrogram))
        mfcc_mean           = (id, np.mean(mfcc))  # mfcc
        mfcc_var            = (id, np.var(mfcc))
        rmse_mean           = (id, np.mean(rms))  # rmse
        rmse_var            = (id, np.var(rms))
        cent_mean           = (id, np.mean(cent))  # cent
        cent_var            = (id, np.var(cent))
        spec_bw_mean        = (id, np.mean(spec_bw))  # spectral bandwidth
        spec_bw_var         = (id, np.var(spec_bw))
        contrast_mean       = (id, np.mean(contrast))  # contrast
        contrast_var        = (id, np.var(contrast))
        rolloff_mean        = (id, np.mean(rolloff))  # rolloff
        rolloff_var         = (id, np.var(rolloff))
        poly_mean           = (id, np.mean(poly_features))  # poly features
        poly_var            = (id, np.var(poly_features))
        tonnetz_mean        = (id, np.mean(tonnetz))  # tonnetz
        tonnetz_var         = (id, np.var(tonnetz))
        zcr_mean            = (id, np.mean(zcr))  # zero crossing rate
        zcr_var             = (id, np.var(zcr))
        harm_mean           = (id, np.mean(harmonic))  # harmonic
        harm_var            = (id, np.var(harmonic))
        perc_mean           = (id, np.mean(percussive))  # percussive
        perc_var            = (id, np.var(percussive))
        # print("=================================================")
        
        # print('chroma_stft_mean:',chroma_stft_mean[1])
        # print('chroma_stft_var:',chroma_stft_var[1])
        
        # print("=================================================")
        
        # print('rmse_mean',rmse_mean)
        # print('rmse_var',rmse_var)
        
        # print("=================================================")
        
        # print('cent_mean',cent_mean)
        # print('cent_var',cent_var)
        
        # print("=================================================")
        
        # print('spec_bw_mean',spec_bw_mean)
        # print('spec_bw_var',spec_bw_var)
        
        # print("=================================================")
        
        # print('rolloff_mean',rolloff_mean)
        # print('rolloff_var',rolloff_var)
        
        # print("=================================================")
        
        # print('zcr_mean',zcr_mean)
        # print('zcr_var',zcr_var)
        # print("=================================================")
        
        # print('harm_mean',harm_mean)
        # print('harm_var',harm_var)
        
        # print("=================================================")
        
        # print('perc_mean',perc_mean)
        # print('perc_var',perc_var)
        
        # print("=================================================")
        
        # print('tempo_vector:',tempo_vector)
        
        # print("=================================================")
        
        print("Start Make Dataframe.... ")
        DataFrame1=pd.DataFrame({
            'filename': [songname],
            'length': [len(y)],
            'chroma_stft_mean' : [chroma_stft_mean[1]],
            'chroma_stft_var'  : [chroma_stft_var[1]],
            'rms_mean': [rmse_mean[1]],
            'rms_var': [rmse_var[1]],
            'spectral_centroid_mean':[cent_mean[1]],
            'spectral_centroid_var': [cent_var[1]],
            'spectral_bandwidth_mean':[spec_bw_mean[1]],
            'spectral_bandwidth_var': [spec_bw_var[1]],
            'rolloff_mean': [rolloff_mean[1]],
            'rolloff_var':[rolloff_var[1]],
            'zero_crossing_rate_mean':[zcr_mean[1]],
            'zero_crossing_rate_var': [zcr_var[1]],
            'harmony_mean': [harm_mean[1]],
            'harmony_var': [harm_var[1]],
            'perceptr_mean':[perc_mean[1]],
            'perceptr_var':[perc_var[1]],
            'tempo':[tempo_vector[1]],
            'mfcc1_mean': [(id, np.mean(mfcc[0]))[1]],
            'mfcc1_var': [(id, np.var(mfcc[0]))[1]],
            'mfcc2_mean': [(id, np.mean(mfcc[1]))[1]],
            'mfcc2_var': [(id, np.var(mfcc[1]))[1]],
            'mfcc3_mean': [(id, np.mean(mfcc[2]))[1]],
            'mfcc3_var': [(id, np.var(mfcc[2]))[1]],
            'mfcc4_mean': [(id, np.mean(mfcc[3]))[1]],
            'mfcc4_var': [(id, np.var(mfcc[3]))[1]],
            'mfcc5_mean': [(id, np.mean(mfcc[4]))[1]],
            'mfcc5_var': [(id, np.var(mfcc[4]))[1]],
            'mfcc6_mean': [(id, np.mean(mfcc[5]))[1]],
            'mfcc6_var': [(id, np.var(mfcc[5]))[1]],
            'mfcc7_mean': [(id, np.mean(mfcc[6]))[1]],
            'mfcc7_var': [(id, np.var(mfcc[6]))[1]],
            'mfcc8_mean': [(id, np.mean(mfcc[7]))[1]],
            'mfcc8_var': [(id, np.var(mfcc[7]))[1]],
            'mfcc9_mean': [(id, np.mean(mfcc[8]))[1]],
            'mfcc9_var': [(id, np.var(mfcc[8]))[1]],
            'mfcc10_mean': [(id, np.mean(mfcc[9]))[1]],
            'mfcc10_var': [(id, np.var(mfcc[9]))[1]],
            'mfcc11_mean': [(id, np.mean(mfcc[10]))[1]],
            'mfcc11_var': [(id, np.var(mfcc[10]))[1]],
            'mfcc12_mean': [(id, np.mean(mfcc[11]))[1]],
            'mfcc12_var': [(id, np.var(mfcc[11]))[1]],
            'mfcc13_mean': [(id, np.mean(mfcc[12]))[1]],
            'mfcc13_var': [(id, np.var(mfcc[12]))[1]],
            'mfcc14_mean': [(id, np.mean(mfcc[13]))[1]],
            'mfcc14_var': [(id, np.var(mfcc[13]))[1]],
            'mfcc15_mean': [(id, np.mean(mfcc[14]))[1]],
            'mfcc15_var': [(id, np.var(mfcc[14]))[1]],
            'mfcc16_mean': [(id, np.mean(mfcc[15]))[1]],
            'mfcc16_var': [(id, np.var(mfcc[15]))[1]],
            'mfcc17_mean': [(id, np.mean(mfcc[16]))[1]],
            'mfcc17_var': [(id, np.var(mfcc[16]))[1]],
            'mfcc18_mean': [(id, np.mean(mfcc[17]))[1]],
            'mfcc18_var': [(id, np.var(mfcc[17]))[1]],
            'mfcc19_mean': [(id, np.mean(mfcc[18]))[1]],
            'mfcc19_var': [(id, np.var(mfcc[18]))[1]],
            'mfcc20_mean': [(id, np.mean(mfcc[19]))[1]],
            'mfcc20_var': [(id, np.var(mfcc[19]))[1]],
            'label'     : [pop]
            })
        # print(DataFrame1)
        
        
        
        
        print("Start Crawling....")
        print("=================================================")
        
        songname = songname.replace(".wav","")
        print(songname)
        headers = {'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36 Edg/92.0.902.84'}
    
               
        murl= "https://www.melon.com/song/detail.htm?songId=33979575"
        
        data = requests.get("https://www.melon.com/song/detail.htm?songId="+str(songname),headers=headers)
        
        html = data.text
        # print(html)
        soup = BeautifulSoup(html, 'lxml')
        # print(soup)
        
        songinfo = soup.select('div#conts > form#downloadfrm > div.section_info > div.wrap_info > div.entry')
        # print(songinfo)
        
        try:
            info = soup.select('div#conts > form#downloadfrm > div.section_info > div.wrap_info > div.entry > div.meta > dl.list > dd')
        except:
            print("Data not found pass ... ")
          
            pass
        
        
        #가수
        singer    = soup.find('div',class_='artist').find('span')
        #가사
        songlyric = soup.find('div',class_='lyric')
        #제목
        title     = soup.find('div',class_='song_name')
        #앨범이미지
        url       = soup.find('a',class_='image_typeAll')
        url       = url.find('img')["src"]
        # print(url)
        
        
        
        try:  
            #가수가 없는경우가 있어서 try pass로 넘겨준다.
            singer = singer.text
        except:
            singer = "Various Artists"
            pass
        try:    
            lyric = songlyric.text.strip()
        except:
            lyric = "none lyric"
            pass
        
        title = title.text.replace("곡명","").strip()
        album = info[0].text
        releasedate  = info[1].text
        genre = info[2].text
        
        # print(singer)
        # print(lyric)
        # print(title)
        # print(album)
        # print(releasedate)
        # print(genre)
        # print("길이 구하기",len(y)/float(sr))
    
        print("Start Make Dataframe.... ")
        TempFrame = pd.DataFrame({\
            'mon'          : [str(songname)],   
            'signer'       : [singer],     
            'lyric'        : [lyric],      
            'title'        : [title],      
            'album'        : [album],      
            'releasedate'  : [releasedate],
            'genre'        : [genre],      
            'url'          : [url],
            'bpm'          : [tempo_vector[1]],
            'length'       : [len(y)/float(sr)]
            })
        
        # print(TempFrame)
        
        print("Start Save Dataframe.... ")
        DataFrame1.to_csv('D:\\음악번호\\getdataset\\audio.csv', mode='a', header=False, index=False)
        TempFrame.to_csv('D:\\음악번호\\getdataset\\audio_Crawling.csv',mode='a',index=False,header=False)
        print("Completion Save Dataframe....")
    except:
        print("패스오류")
        pass
    
        
