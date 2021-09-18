// tw 0084 (f0) - http://sccode.org/1-4Qy
{var a = Saw
;var f = a.ar(5.series(7,15) * 19) * 99 + 199
;var g = a.ar(1.series(3,13) * 29) * 199 + 299
;var w = a.ar(3.series(5,11) * a.ar(3,2,3)) * 299 + 399
;Splay.ar(Formant.ar(f,g,w)) / 3}

// calculations
5.series(7,15) == (6.iota * 2 + 5)
1.series(3,13) == (7.iota * 2 + 1)
3.series(5,11) == (5.iota * 2 + 3)
