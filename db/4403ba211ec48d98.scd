// https://sccode.org/1-4S6 ; f0 ; 't'
var p = Saw.ar([3, 4]) * (Saw.ar(1) * 32 + 128) + Duty.ar(1, 0, (Dseq([0, 8, 1, 5], 1) * [1, 4, 8]).flop);
var o = SinOsc.ar(Saw.ar(3) * 64 + 99, p) / 9;
CombN.ar(o, 1 / 4, 1 / 2.125, SinOsc.kr(0.005, 1.5 * pi).range(0, 6))
