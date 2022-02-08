// hedge trimmer ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #5
Mix(BPF.ar(PinkNoise.ar(0.6),(1..64)*LFNoise2.kr(4,30,100), 0.01)).dup
