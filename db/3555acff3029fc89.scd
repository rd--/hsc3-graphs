// https://sccode.org/1-4Qy ; f0 ; 0307
var a = 2 + Blip.ar(3 / [8, 9], 2).rounded;
var c = a ** Lag(a, 0.1);
var o = Blip.ar(Duty.ar(1 / [9, 8], 0, Dseq("AVVVF".ascii.midiCps, inf) / a), c) * (c + 5);
CombN.ar(o, 0.2, 0.2, 1).tanh
