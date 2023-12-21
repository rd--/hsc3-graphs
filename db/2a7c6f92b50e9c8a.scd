// https://twitter.com/redFrik/status/1235224072579100675
var f = 9;
var e = (f % pi).floor;
var b = 9.iota + pi.tanh * pi * pi;
var c = b.reciprocal;
var j = SinOsc.ar(b * f, c) * SinOsc.ar(c, 0).max(0) + AllpassC.ar(LocalIn.ar(f, 0), e, SinOsc.ar(c / f, 0) / f + e / e, e) * e;
var o = BPF.ar(Normalizer.ar(j, e / e , c), SinOsc.ar(c, 0).exprange(f, e ** f * f), 1);
Splay.ar(o).sin <! LocalOut.ar(o.rotate(1))
