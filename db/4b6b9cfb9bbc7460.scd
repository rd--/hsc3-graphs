// <https://twitter.com/redFrik/status/1452599226882535431> f0
var e = LFSaw.kr(0.1, 0);
var b = #[1, 2, 3, 4] / 2;
var f = #[0, 1];
var d = LFSaw.ar(11, f).exprange(2 ** LFSaw.kr(0.061, f) * 4 - 1, 2 ** LFSaw.kr(0.031, f) * 20 - 8);
var x = LFSaw.ar(LFSaw.kr(0.001, b).roundTo(LFSaw.ar(0.071, 0) > 0 / 8) * 5, 0);
var y = x.exprange(Latch.kr(2 ** LFSaw.kr(0.041, f) * 120 - 59, e), Latch.kr(2 ** LFSaw.kr(0.051, 0) * 500, e));
var o = Blip.ar(y, d) * 1 / d.max(1);
HPF.ar(o.splay, 9)
