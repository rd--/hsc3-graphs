// http://sccode.org/1-4Qx (jar)
var f = LFPar.kr(9.1, 0, 100, 4.iota + 2 * 100);
var g = LFPar.kr(9, 0, 1, LFPar.kr(1 / [2, 3, 5, 7], 0, 0.5, 0));
var h = LFPar.kr(1/2, 0, 0.4, 0.5);
Splay.ar(LFPar.ar(f, 0, (g > h).lag / 2))

//----
(200,300..500) == (4.iota + 2 * 100)