// https://sccode.org/1-4Qy ; f0 ; 0266
var b = (1 .. 6) / 2;
var e = SinOsc.ar(b / 99, 0) * 2 + 3;
var c = SinOsc.ar(b, 0).div(4 / b) + e.round * 99;
var d = Splay.ar(SinOsc.ar(c, 0));
d.sin + (SinOsc.ar(c * 1.5, e / d) * 0.7 / e).mean / 2
