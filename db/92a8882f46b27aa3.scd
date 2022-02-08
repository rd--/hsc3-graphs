// trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13b
var p=[1,2]+0.01;Mix(SinOsc.ar(1000*Mix(Lag.ar((LFSaw.ar(p*0.4)/p).round(1/6),2e-3)))).dup*0.2
