// shifty feedback ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #16c
CombC.ar(SinOsc.ar(100,0,0.1), 2, LFTri.ar(LFNoise0.ar(0.2)+1,0,0.6,1.4), 80).dup
