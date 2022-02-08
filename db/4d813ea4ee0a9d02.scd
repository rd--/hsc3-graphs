// shifty feedback ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #16b
CombC.ar(SinOsc.ar(200,0,0.1), 2, LFNoise1.ar(13.8389*LFSaw.ar(0.1)+14,0.5,1.4), 20).dup
