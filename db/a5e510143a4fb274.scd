// https://sccode.org/1-4Qy ; f0 ; 0349
var c = { Dseq([5, 1, 3, 2], inf) };
var e = 1 / [8, 4];
var f = Duty.ar(e, 0, c.value * Duty.ar(e / 4, 0, c.value, 0)) * Duty.ar(1 / e, 0, c.value * 28.8, 0);
SinOsc.ar(f, 0) * SinOsc.ar(e / 9, 0)
