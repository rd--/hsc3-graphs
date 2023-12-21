// f0  https://twitter.com/redFrik/status/1395878538297892865
var t = Impulse.ar(5, 0);
var g = #[3, 2];
var e = t.lagud(0.001, SinOscFB.ar(g / 99, 0) + 1.08);
var m = [24,0,3,5,7,10,36].collect({ | i | i + [36,48,36,33,60,72]}).flat;
var o = SinOscFB.ar(Demand.ar(t, 0, Dseq.dr(m.midicps, inf) / g), SinOscFB.ar(0.02, 0)) * e;
var c = RLPF.ar(o, 3 ** SinOscFB.ar(0.04, 0) + e * 2000, 3 ** SinOscFB.ar(g / 9, 0) / 3) * 4;
(CombN.ar(c.tanh, 1, 1 / 2, 4) + CombN.ar(c, 1, 1 / 3, 5) / 8 + c).tanh * 0.1
