// MiBraids ; trigger ; 28=plucked
var trig = Dust.kr(0.6);
var pitch = TRand.kr(45, 72, trig).round;
var timbre = 0.5;
var color = LFNoise1.kr(0.3) * 0.5 + 0.5;
MiBraids.ar(pitch: pitch, timbre: timbre, color: color, model: 28, trig: trig, resamp: 0, decim: 0, bits: 0, ws: 0).dup(2) * 0.1
