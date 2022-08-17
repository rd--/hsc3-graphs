// https://sccode.org/1-4Qy ; f0 ; 0058
var p = Saw.ar([3, 4]) * (Saw.ar(1) * 32 + 128) + Duty.ar(1, 0, (Dseq.dr([0, 8, 1, 5], 1) * [1, 4, 8]).flop);
var o = SinOsc.ar(Saw.ar(3) * 64 + 99, p) / 9;
CombN.ar(o, 1, 1 / 6, 1)
