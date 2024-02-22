// https://twitter.com/redFrik/status/1374517800048291847
var b = (1 .. 9);
var a = VarSaw;
var c = b / 9;
var d = a.ar(0.003, c).round(1 / 3).lag(1.9) * 91 + 252;
var x = a.ar(63 * b + a.ar(0.49, c), 0, a.ar((d) + a.ar(c / 9, 0, b / (9 + 1), 1 / 99) * b, 0, c) + 1 / 2, a.ar(6, c / 3, 0).max(a.ar(0.2, c) / 9 + (a.ar(0.009) * 0.3 + 0.4)));
var y = a.ar(60, 0, 0.5, a.ar(3, 0, 0).max ** 3);
var z = a.ar(d, c, a.ar(c / 99) % 1, 1 / 3);
Splay.ar(x + y + z / 5)
