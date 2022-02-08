// feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12c
var p=PinkNoise.ar(0.03.dup);p+CombC.ar(p,0.2,LFNoise0.ar(1,0.2,0.2),-1e4)
