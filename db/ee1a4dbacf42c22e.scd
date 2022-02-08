// noise slurps ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #11
SinOsc.ar(0, BPF.ar(WhiteNoise.ar(1e3.dup), LFNoise1.kr(0.1.dup,2e3,4e3),1e-3),0.1)
