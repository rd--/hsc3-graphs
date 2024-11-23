/* Demand */
let n = Dseq(inf, [0 2 4 5 7 9 11 12]) + (TRand(3, 6, Dust(9)).RoundTo(0) * 12);
let t = Impulse(10, 0);
let f = Demand(t, 0, n.MidiCps);
let o = SinOsc([f, f + 0.7], 0);
o.cubed.cubed * 0.1
