(* Demand *)
var n = Diwhite(inf, 60, 72);
var t = Impulse(10, 0);
var f = Demand(t, 0, n.MidiCps);
var o = SinOsc([f, f + 0.7], 0);
o.cubed.cubed * 0.1
