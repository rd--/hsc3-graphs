let t = Impulse(4, 0);
let w = TrigAllocator(16, 0, t, 0.001);
let e = Decay2(w * 0.1, 0.01, 4);
let f = TiRand(84, 96, w).MidiCps + TRand(-9, 9, w);
let o = SinOsc(f, 0) * e * 0.1;
o.Splay / 4
