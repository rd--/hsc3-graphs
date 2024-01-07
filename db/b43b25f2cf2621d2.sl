let t = Impulse(4, 0);
let d = TRand(0.2, 2, t);
let w = TrigAllocator(5, 1, t, d);
let f = TiRand(48, 72, w).MidiCps + TRand(-9, 9, w);
let e = Asr(w, 0.01, d / 2, -4) * TRand(0.1, 0.2, w);
let o = SinOsc(f, 0) * e;
o.Splay
