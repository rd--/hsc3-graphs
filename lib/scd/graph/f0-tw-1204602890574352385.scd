// https://twitter.com/redFrik/status/1204602890574352385
var c = 1 + 1;
var d = 1 / (11.iota + 1) / 1;
var p = VarSaw.ar([11 - 1, 11 << 1, 11, 11 >> 1, 11 + 1] ** (VarSaw.ar(11.1, 1, 1 / 11) + 1.11111111), 0, 0.5);
var q = VarSaw.ar(d, d, 1 / 11) * VarSaw.ar(1.11 / d, 1, 1.1 - d) * 11 + 1;
var r = (VarSaw.ar(d * 11 / 111, 1, 1 / c) + (1.1 / c)).max(0);
var z = CombN.ar((p * q).cos, d, d + 1 / (111 >> 1), r) / c;
LeakDC.ar(LPF.ar(Splay.ar(CombN.ar(z, c, c / 11 / d, 1)), 11111), 0.995).sin * 0.5

// ---- https://twitter.com/redFrik/status/1204602890574352385
{a=VarSaw;ar(LeakDC,ar(LPF,ar(Splay,ar(b=CombN,ar(b,cos(ar(a,[11-1,11<<1,11,11>>1,11+1]**ar(a,11.1,1,1/11,1,1.11111111))*ar(a,d=1/(1..11)/1,d,1/11,ar(a,1.11/d,1,1.1-d,11),1)),d,d+1/(111>>1),ar(a,d*11/111,1,1/(c=1+1),1,1.1/c,d).max,1/c),c,c/11/d)),11111)).sin}

// ---- calculations
(1 / 1.series(nil, 11) / 1) == (1 / (11.iota + 1) / 1)