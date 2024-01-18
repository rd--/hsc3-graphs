{- Demand -}
let n = Diwhite(inf, 60, 72);
let t = Impulse(10, 0);
let f = Demand(t, 0, n.MidiCps);
let o = SinOsc([f, f + 0.7], 0);
o.cubed.cubed * 0.1
