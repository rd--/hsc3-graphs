// trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13a
var p=[1,3,5];Mix(SinOsc.ar(800*Mix((SinOsc.ar(p*0.1)/p).round(1/6)))).dup*0.2
