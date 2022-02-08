// shifty feedback ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #16d
CombC.ar(SinOsc.ar(200,0,0.1), 2, LFTri.ar(LFSaw.ar(pi/9)*9+9,0,0.1,1.9), 20).dup
