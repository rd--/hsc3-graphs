// MiBraids ; scanning
var pitch = MouseY.kr(33, 72, 0, 0.2);
var timbre = LFNoise1.kr(0.3) * 0.5 + 0.5;
var color = LFNoise1.kr(0.3) * 0.5 + 0.5;
var model = MouseX.kr(0, 47, 0, 0.2);
MiBraids.ar(pitch: pitch, timbre: timbre, color: color, model: model, trig: 0, resamp: 0, decim: 0, bits: 0, ws: 0).dup(2) * 0.1
