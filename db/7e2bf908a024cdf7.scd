// https://sccode.org/1-4Qy ; f0 ; 0320
var b = [2, 4, 9, 3] * 9;
var o = VarSaw.ar(VarSaw.ar(1 / b, 0, 0.5) > 0 + 3 * b, 0, Lag.ar(VarSaw.ar(b / 2000, 0, 0.5) + 1 / 2, 1));
Splay.ar(CombC.ar(o, 1.1, (VarSaw.ar(8 / b, 0, 0.5) % 1).round + 0.1, 8)) / 3
