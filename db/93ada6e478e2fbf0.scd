// https://sccode.org/1-4Qy ; f0 ; 0330
var c = SinOsc.ar([2, 3] / 8, 0) % 0.5;
var o = FreqShift.ar(c, SinOsc.ar(1 / [9, 5], 0).roundTo(c > 0.125) + 1 * [3, 2] * 99).tanh / 2;
GVerb.ar(o, 200, 9, 1, 1, 9, 1, 0.1, 0.5, 300)
