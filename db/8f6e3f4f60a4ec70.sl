var t = Impulse(4, 0);
var r = TrigRoundRobin(5, t);
var f = TiRand(48, 72, r).MidiCps;
var e = Decay2(r, 0.05, 2);
var o = SinOsc(f, 0) * e;
o.Splay
