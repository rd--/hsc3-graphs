(* f0 <https://twitter.com/redFrik/status/1338987643057688579> *)
var b = [8 .. 18];
var x = VarSaw([18.1, 81.8, 1.81] + b, 1, VarSaw(b / 81, 0, 0.5));
var t = VarSaw(8 / 1.818, [1, 8 / 18], 0.5);
var d = VarSaw(b / 181.8, 0, 0.5).ExpRange(1.81 / 818, 1.8 / 181.8).RoundTo(1.81 / 818);
var c = VarSaw(1 / 8, 1 / b, 0.5) + 8.18 * 1.8;
var z = VarSaw(1 / 81.8, 0, 0.5).Range(1.8 ^ -1, 8.1 / 8.18);
var p = Pluck(x, t, 1.8 / 181.8, d, c, z) * VarSaw(1.8 / b, 0, 0.5)  /  1.8;
Hpf(Splay(p), 18 / 1.81)