{- Dseq -}
let t = Impulse(2, 0);
let m = Demand(t, 0, Dseq(inf, [55 60 63 62 60 67 63 58]));
SinOsc(m.MidiCps, 0) * 0.1
