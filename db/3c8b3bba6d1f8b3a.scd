// TrigAllocator ; no voice stealing
var t = Impulse.kr(1, 0);
var d = TIRand.kr(2, 9, t);
var w = TrigAllocator.kr(numChannels: 8, algorithm: 0, in: t, dur: d);
var e = Asr.ar(w, d / 3, d / 3, -4) * TRand.kr(0.1, 0.2, w);
var f = TIRand.kr(48, 72, w).midicps + TRand.kr(-9, 9, w);
var o = SinOsc.ar(f, 0) * e;
Splay.ar(o)
