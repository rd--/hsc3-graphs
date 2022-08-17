// https://sccode.org/1-4Qy ; f0 ; 0274
var b = 1 / [1, 8, 2];
var f = Duty.ar(b, 0, Dseq(' #SuperCollider '.ascii.pyramid(1) * 9 ** 1.0595 / 2, inf));
Splay2.ar(SinOsc.ar(f, SinOsc.ar(b, 0) * lag(SinOsc.ar(0 - b, 0) < 0.9) * 5000)) / 3
