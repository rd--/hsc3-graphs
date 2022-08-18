// 20060918 ; rd
var n0 = { BrownNoise.kr }.dup(2);
var n1 = { BrownNoise.kr }.dup(2);
var n2 = { BrownNoise.kr }.dup(2);
var t = Dust.kr(0.75);
var l = Latch.kr(t, t);
var p = Pulse.ar(n0.range(2, [11, 15]), 0.01) * 0.1;
var f = n1.range(300, 1800);
var rq = n2.range(0.01, 2);
l * RLPF.ar(p, f, rq)
