(* Nice use of Blip *)
var t = Impulse(6, 0);
var o = Blip(TRand(48, 72, t).MidiCps, TRand(1, 12, t)) * TRand(-0.5, 0.4, t).Max(0);
var p = Pan2(o, TRand(-1.0, 1.0, t), Decay2(t, 0.1, 3) * 0.5);
p + CombL(p, 2.0, 4 / 6, 6)
