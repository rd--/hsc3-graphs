// inverted saw ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #4
(Saw.ar(LFNoise1.kr(1,1e3,1200),0.3)*FSinOsc.ar(SampleRate.ir/2,1)).dup
