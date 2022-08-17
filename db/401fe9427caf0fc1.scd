// https://sccode.org/1-4Qy ; f0 ; 0290
var b = [99, 98];
var c = SinOsc.ar(12, 0);
var o = SinOsc.ar(b, c) + (SinOsc.ar(c > 0 * 8 * b, 0) * SinOsc.ar(1 / b, 0));
(AllpassC.ar(o, 1, SinOsc.ar(1 / [3, 4], 0) % 1, 8) * SinOsc.ar(1 / 64, [0, 1]) * 3).sin * 0.5
