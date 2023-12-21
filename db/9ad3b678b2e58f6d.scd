// TrigRoundRobin ; audio rate
var t = Impulse.ar(1, 0);
var w = TrigRoundRobin.ar(4, t);
var e = Decay2.ar(w, 0.05, 2) * TRand.ar(0.25, 1, w);
var f = TIRand.ar(48, 84, w).midiCps;
var o = SinOsc.ar(f, 0) * e;
o.splay2
