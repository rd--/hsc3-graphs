// https://twitter.com/redFrik/status/454598285861617665
var b = 9.series(8, 1);
var c = LFTri.ar(3 ** LFTri.ar(1 / b, b / 9), 0);
var d = LFTri.ar(1 / b, 0) % 1 / 9 + 0.01;
var f = 2 ** LFTri.ar(b / 99, 0).round * 99 * b;
var o = GrainSin.ar(2, c, d, f, 0, -1, 512);
Splay.ar(o.tanh) / 2

//---- https://twitter.com/redFrik/status/454598285861617665
a=LFTri;c=a.ar(3**a.ar(1/b=(9..1),b/9));Splay.ar(GrainSin.ar(2,c,a.ar(1/b)%1/9+0.01,2**a.ar(b/99).round*99*b).tanh)/2

//---- calculations
(9..1) == (9.iota.neg + 9) // iota
(9..1) == 9.series(8, 1)
