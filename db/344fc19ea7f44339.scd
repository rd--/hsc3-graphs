// MiBraids ; 1=morph ; some modulation
var mod = LFNoise1.kr(0.5) * 0.5 + 0.5;
MiBraids.ar(pitch: 40, timbre: mod, color: 0, model: 1, trig: 0, resamp: 0, decim: 0, bits: 0, ws: 0).dup(2) * 0.05
