// max
var freq = { LFNoise2.kr(1) }.dup(3)  * 100 + 200;
var freqMax = freq.inject(0, { |i j| i.max(j) });
(LFTri.ar(freqMax, 0) * 0.05) + (Splay.ar(SinOsc.ar(freq, 0)) * 0.1)
