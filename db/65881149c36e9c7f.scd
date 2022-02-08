// trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13d
var p=[1,2]+0.04;Mix(SinOsc.ar(1400*Mix(Lag.ar((LFTri.ar(p*0.2)/p).round(1/8),2e-3)))).dup*0.2
