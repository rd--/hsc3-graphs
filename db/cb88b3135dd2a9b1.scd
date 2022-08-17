// MiBraids ; 40=paraphonic
var timbre = LFNoise1.kr(0.03) * 0.5 + 0.5;
var color = LFNoise1.kr(0.05) * 0.5 + 0.5;  // chord
MiBraids.ar(pitch: 38, timbre: timbre, color: color, model: 40, trig: 0, resamp: 1, decim: 0, bits: 0, ws: 0).dup(2) * 0.1
