// https://twitter.com/headcube/status/289761321065541633 (nv)
var i = InFeedback.ar(20, 99);
var n = { LFNoise1.kr(0.001) }.dup(99) + 1 / 99;
var j = CombL.ar(LPF.ar(i, 2000), 1, n, 0.05);
var d = { Dust2.ar(0.01) }.dup(99);
var x = (j + d).sin;
Splay.ar(x) <! Out.ar(20, (x - x.rotate(1)) / 2)
