// https://sccode.org/1-4Qy ; f0 ; 0348
var b = [9, 4, 3, 6] / 4;
var c = VarSaw.ar(0.1 / b) + 1 / 9;
var o = 9 ** c * VarSaw.ar((VarSaw.ar(c / 3, 0, 0.5) + b).round(b) * 99, 0, c);
Splay.ar(AllpassC.ar(o, 1, c + 9 / 99, 9).tanh) / 2
