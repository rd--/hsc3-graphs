// sine slurps ;  ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #10
SinOsc.ar(0, BPF.ar(Dust.ar(10.dup)*20000, LFNoise1.kr(10.dup,4e3,4e3), 0.1),0.2)
