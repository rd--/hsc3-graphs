// trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13e
var p=[1,4]+0.01;Mix(SinOsc.ar(1400*Mix(Lag.ar((LFTri.ar(p*0.2)/p).round(1/8),2e-3)))).dup*0.2
