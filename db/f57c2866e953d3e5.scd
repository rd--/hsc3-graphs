// max
var freq = { LFNoise2.kr(1) }.dup(3)  * 100 + 200;
var freqMax = freq.inject(0, { arg i, j; i.max(j) });
(LFTri.ar(freqMax, 0) * 0.05) + (SinOsc.ar(freq, 0).splay2 * 0.1)
