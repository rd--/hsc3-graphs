(* tw 0121 (f0) ; requires=kr *)
var z = SinOsc(1 / [8, 7], 0) * SinOsc(1 / 30, 0) * 9;
var l = (0 .. 7) * 6 + 56;
var m = SinOsc(1 / [4, 3], 0);
var o = SinOsc(Select(z, l).kr.MidiCps, 0) * m;
CombN(o, 1, 1 / [6, 5], 9).Tanh * 0.1
