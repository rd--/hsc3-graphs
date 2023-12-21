// https://sccode.org/1-4Qy ; f0 ; 0329
var e = SinOsc.ar(97 / Lag.ar((SinOsc.ar(1 / 32, 0) + 2.2).rounded, 0.1), 0) * pi;
var c = SinOsc.ar(99, LocalIn.ar(9, 0) * SinOsc.ar(1.to(9) / 99 - 98, 0) * e);
LocalOut.ar(c);
Splay2.ar(c / 2)
