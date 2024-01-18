// tw 0084 (f0) - http://sccode.org/1-4Qy
var f = Saw.ar(5.series(7,15) * 19) * 99 + 199;
var g = Saw.ar(1.series(3,13) * 29) * 199 + 299;
var w = Saw.ar(3.series(5,11) * Saw.ar(3, 2, 3)) * 299 + 399;
Splay.ar(Formant.ar(f, g, w)) / 3 / 3

//---- calculations
5.series(7,15) == (6.iota * 2 + 5) // iota
1.series(3,13) == (7.iota * 2 + 1) // iota
3.series(5,11) == (5.iota * 2 + 3) // iota
