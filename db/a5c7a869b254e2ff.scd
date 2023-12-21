// tw 0077 (f0) - http://sccode.org/1-4Qy
var f = SinOsc.ar(1 / [5, 6], 0) + [798, 912];
var p = SinOsc.ar(1 / 16, 0) * 19 + 99 * SinOsc.ar([9, 8], 0);
var m = SinOsc.ar(SinOsc.ar(6, 0) * SinOsc.ar(0.009, 0), 0);
var b = SinOsc.ar(f, p) * m;
SinOsc.ar([201, 301], b).tanh * 0.25
