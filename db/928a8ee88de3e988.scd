// f0 <https://twitter.com/redFrik/status/1338987643057688579>
var b = (8 .. 18);
var x = VarSaw.ar([18.1, 81.8, 1.81] + b, 1, VarSaw.ar(b / 81, 0, 0.5));
var t = VarSaw.ar(8 / 1.818, [1, 8 / 18], 0.5);
var d = VarSaw.ar(b / 181.8, 0, 0.5).exprange(1.81 / 818, 1.8 / 181.8).round(1.81 / 818);
var c = VarSaw.ar(1 / 8, 1 / b, 0.5) + 8.18 * 1.8;
var z = VarSaw.ar(1 / 81.8, 0, 0.5).range(1.8 ** -1, 8.1 / 8.18);
var p = Pluck.ar(x, t, 1.8 / 181.8, d, c, z) * VarSaw.ar(1.8 / b, 0, 0.5)  /  1.8;
HPF.ar(Splay.ar(p, 1, 1, 0, true), 18 / 1.81)
