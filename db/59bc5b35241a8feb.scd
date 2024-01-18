// MiBraids ; 34=kick
var trig =  Impulse.kr(4, 0);
var pitch = LinLin.kr(Latch.kr(PinkNoise.kr(), trig), -1, 1, 30, 50).round;
var timbre = LFNoise1.kr(0.4) * 0.5 + 0.5;
var color = LFNoise1.kr(0.3) * 0.5 + 0.5;
MiBraids.ar(pitch: pitch, timbre: timbre, color: color, model: 34, trig: trig, resamp: 0, decim: 0, bits: 0, ws: 0).dup(2) * 0.2
