// tw 0084 (f0) - http://sccode.org/1-4Qy
var f = Saw.ar(6.iota * 2 + 5 * 19) * 99 + 199;
var g = Saw.ar(7.iota * 2 + 1 * 29) * 199 + 299;
var w = Saw.ar(5.iota * 2 + 3 * Saw.ar(3, 2, 3)) * 299 + 399;
Formant.ar(f, g, w).splay / 3 / 3
