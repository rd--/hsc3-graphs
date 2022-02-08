// Vibrato
var n = LFNoise1.kr(1) * 3 + 7;
var x = MouseX.kr(0, 1, 0, 0.2);
var y = MouseY.kr(0, 1, 0, 0.2);
var v = Vibrato.ar(DC.ar(400), n, x, 1, 1, y, 0.1, 0, 0);
SinOsc.ar(v, 0) * 0.1
