// https://sccode.org/1-4Qy ; f0 ; 0232
var b = [4, 3];
var q = 9.fib.pyramid(1) * 99;
var o = SinOsc.ar(Duty.ar(1 / b, 0, Dseq(q, inf)), 0);
var e = SinOsc.ar(b / 9, 0);
var d = SinOsc.ar(b / 999, 0).abs + 0.01;
CombC.ar(o * e, 1.01, d, 9).tanh / 2
