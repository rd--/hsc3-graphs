// saw scratching ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #15
CombC.ar(LFSaw.ar([0.49,1,1.51,1.89]*200, 0, 0.1), 1, RLPF.ar(LFNoise2.ar(0.1, 0.4, 0.6), 10, 1.1).clip(0.21,1), 15).dup
