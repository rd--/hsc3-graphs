// TrigAllocator ; voice stealing ; algorithm input selects rule
var t = Impulse.kr(4, 0);
var d = TRand.kr(0.2, 2, t);
var w = TrigAllocator.kr(5, 1, t, d);
var e = Asr.ar(w, 0.01, d / 2, -4) * TRand.kr(0.1, 0.2, w);
var f = TIRand.kr(48, 72, w).midicps + TRand.kr(-9, 9, w);
var o = SinOsc.ar(f, 0) * e;
Splay.ar(o)
