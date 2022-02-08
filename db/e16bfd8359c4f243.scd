// spectral harp ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #6
var p=SinOsc.ar(1760,0,0.01.dup);p+CombC.ar(p,0.1,LFNoise1.ar(0.5,0.1,0.1),-10)
