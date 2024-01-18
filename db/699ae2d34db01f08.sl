{- Duty ; c.f. equivalent Demand graph ; (Duty) -}
let tr = Dust(9);
let n = Dseq(inf, [0, 2, 4, 5, 7, 9, 11, 12]) + (TRand(3, 6, tr).RoundTo(1) * 12);
let f = Duty(0.1, 0, n.MidiCps);
let o = SinOsc([f, f + 0.7], 0);
o.Cubed.Cubed * 0.1
