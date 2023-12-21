(* CombN *)
var m = LfNoise1(3) * 24 + (LfSaw([5, 5.123], 0) * 3 + 80);
CombN(SinOsc(m.MidiCps, 0) * 0.4, 1, 0.3, 2)
