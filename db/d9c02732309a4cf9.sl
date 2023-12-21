(* TrigAllocator ; no voice stealing *)
var t = Impulse(1, 0);
var d = TiRand(2, 9, t);
var w = TrigAllocator(8, 0, t, d);
var e = Asr(w, d / 3, d / 3, -4) * TRand(0.1, 0.2, w);
var f = TiRand(48, 72, w).MidiCps + TRand(-9, 9, w);
var o = SinOsc(f, 0) * e;
o.Splay
