(* TrigAllocator ; no voice stealing *)
let t = Impulse(1, 0);
let d = TiRand(2, 9, t);
let w = TrigAllocator(8, 0, t, d);
let e = Asr(w, d / 3, d / 3, -4) * TRand(0.1, 0.2, w);
let f = TiRand(48, 72, w).MidiCps + TRand(-9, 9, w);
let o = SinOsc(f, 0) * e;
o.Splay
