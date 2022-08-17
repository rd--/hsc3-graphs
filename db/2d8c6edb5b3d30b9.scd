// https://sccode.org/1-4Qy ; f0 ; 0356
var b = [4, 16, 3];
var o = LFTri.ar(b, 0) * LFTri.ar(b * b, 0);
var f1 = 8 ** LFTri.ar(b / 50, 0).roundTo(1) * 99;
var f2 = 3 ** LFTri.ar(1 / b, 0) * 99;
Splay2(BHiPass4.ar(BLowPass4.ar(o, f1, 1), f2, 0.1).sin)
