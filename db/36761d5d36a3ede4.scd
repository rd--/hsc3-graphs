// trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13f
var p=[-4,-2,-1,1.04,2.01,4.02];Mix(LFSaw.ar([1,2.01,5.03]*100*Mix(LFSaw.ar(p.abs*0.4,0,1/p).round(1/4)))).dup*0.2
