(* TrigAllocator ; voice stealing ; algorithm input selects rule *)
var t = Impulse(4, 0);
var d = TRand(0.2, 2, t);
var w = TrigAllocator(5, 1, t, d);
var e = Asr(w, 0.01, d / 2, -4) * TRand(0.1, 0.2, w);
var f = TiRand(48, 72, w).MidiCps + TRand(-9, 9, w);
var o = SinOsc(f, 0) * e;
o.Splay