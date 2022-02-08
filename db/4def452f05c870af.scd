// blizzard ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #8
var n=LFNoise1; var f=0.2.dup(8);Mix(BPF.ar(PinkNoise.ar(0.2),n.kr(f,1e3,1040),n.kr(f,0.3,0.31))).dup
