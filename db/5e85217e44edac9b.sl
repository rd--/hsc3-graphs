var t = Impulse(4, 0);
var w = TrigRoundRobin(5, t);
var f = TiRand(48, 72, w).MidiCps;
var e = Decay2(w, 0.05, 2);
var o = SinOsc(f, 0) * e;
o.Splay
