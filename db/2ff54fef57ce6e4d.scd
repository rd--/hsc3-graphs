// MiBraids ; 21=vosim
var pitch = LFNoise0.kr(4).range(33, 66).round;
var timbre = LFNoise1.kr(0.3,0.5,0.5);
var color = LFNoise1.kr(0.3,0.5,0.5);
MiBraids.ar(pitch: pitch, timbre: timbre, color: color, model: 21, trig: 0, resamp: 0, decim: 0, bits: 0, ws: 0).dup(2) * 0.1
