(* Duty ; c.f. equivalent Demand graph ; (Duty) *)
var tr = Dust(9);
var n = Dseq(inf, [0, 2, 4, 5, 7, 9, 11, 12]) + (TRand(3, 6, tr).RoundTo(1) * 12);
var f = Duty(0.1, 0, n.MidiCps);
var o = SinOsc([f, f + 0.7], 0);
o.Cubed.Cubed * 0.1
