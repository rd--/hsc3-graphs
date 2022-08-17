// https://sccode.org/1-4Qy ; f0 ; 340
var c = SinOsc.ar([4, 3, 2] / 64, 0) % 1;
var p = Spring.ar(Spring.ar(Spring.ar(SinOsc.ar([2, 3], 0) > 0, 4, c[0] / 4), 9, c[1] / 3), 24, c[2] / 3) * 9;
CombN.ar(SinOsc.ar(0, p) * 0.7, 0.2, 0.2, 1)
