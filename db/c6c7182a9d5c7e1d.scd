// https://sccode.org/1-4Qy ; f0 ; 0248
var d = LFTri.ar(0.1, 0) < 0;
var b = d + (2 .. 8) / (d + 2);
var o = LFTri.ar(b * 99, 0);
var r = Ringz.ar(LFTri.ar(b / 2, 0) > 0, b * 99, 5 ** LFTri.ar(LFTri.ar(0.01, 0) + 2 - b) / 4);
Splay.ar(o + r).tanh
