// tw 0084 (f0) - http://sccode.org/1-4Qy
{var a = Saw
;var f = a.ar(6.iota * 2 + 5 * 19) * 99 + 199
;var g = a.ar(7.iota * 2 + 1 * 29) * 199 + 299
;var w = a.ar(5.iota * 2 + 3 * a.ar(3, 2, 3)) * 299 + 399
;Splay.ar(Formant.ar(f, g, w)) / 3}