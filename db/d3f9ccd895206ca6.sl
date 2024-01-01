var t = Impulse(4, 0);
var w = TrigAllocator(16, 0, t, 0.001);
var e = Decay2(w, 0.01, 4);
var f = TiRand(84, 96, w).MidiCps + TRand(-9, 9, w);
var o = SinOsc(f, 0) * e * 0.1;
o.Splay
