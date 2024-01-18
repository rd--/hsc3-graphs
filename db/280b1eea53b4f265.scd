// TrigAllocator ; cycle when not stealing
var t = Impulse.kr(4, 0);
var w = TrigAllocator.kr(16, 0, t, 0.001);
var e = Decay2.kr(w, 0.01, 4);
var f = TIRand.kr(84, 96, w).midicps + TRand.kr(-9, 9, w);
var o = SinOsc.ar(f, 0) * e * 0.1;
Splay.ar(o)
