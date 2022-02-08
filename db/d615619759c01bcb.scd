// sc-140 ; 20 ; Sciss
2.collect{RecordBuf.ar(Limiter.ar(HPF.ar(Convolution2.ar(k=Crackle.ar(l=Line.kr(1,2,90)),b=LocalBuf(2048),Dust.kr(4)),8)+k)*(2-l),b)}
