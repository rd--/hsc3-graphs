// https://twitter.com/redFrik/status/1204602890574352385
var c = 1 + 1;
var d = 1 / (1 .. 11) / 1;
var p = VarSaw.ar([11 - 1, 11 << 1, 11, 11 >> 1, 11 + 1] ** (VarSaw.ar(11.1, 1, 1 / 11) + 1.11111111), 0, 0.5);
var q = VarSaw.ar(d, d, 1 / 11) * VarSaw.ar(1.11 / d, 1, 1.1 - d) * 11 + 1;
var r = (VarSaw.ar(d * 11 / 111, 1, 1 / c) + (1.1 / c)).max(0);
var z = CombN.ar((p * q).cos, d, d + 1 / (111 >> 1), r) / c;
LeakDC.ar(LPF.ar(Splay.ar(CombN.ar(z, c, c / 11 / d, 1)), 11111), 0.995).sin * 0.5
