// TrigRoundRobin ; control rate
var t = Impulse.kr(1, 0);
var w = TrigRoundRobin.kr(numChannels: 4, in: t);
var e = Decay2.kr(w, 0.05, 2) * TRand.kr(0.25, 1, w);
var f = TIRand.kr(48, 84, w).midicps;
var o = SinOsc.ar(f, 0) * e;
Splay.ar(o)
