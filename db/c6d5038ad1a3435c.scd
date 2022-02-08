// trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13c
var p=[0.5,1,2];Mix(SinOsc.ar(1000*Mix(Lag.ar((LFSaw.ar(p*0.4)/p).round(1/8),2e-3)))).dup*0.2
