// LinRandN
var freq = LinRandN.ir(numChannels: 2, lo: 110, hi: 220, minmax: 0);
var amp = LinRandN.ir(numChannels: 2, lo: 0.05, hi: 0.10, minmax: 0);
SinOsc.ar(freq: freq, phase: 0) * amp
