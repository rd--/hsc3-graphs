// https://twitter.com/headcube/status/387489141274857472 (nv) - not stable here (2014-06-14)
{var n = LFNoise0
;var x = Saw.ar(0.7 ** lag(kr(n, 1/5), 2) * [601,500,749])
;var f =
 {arg i
 ;var a = 0.9 ** i
 ;x = x + BAllPass.ar(x, 9 ** n.kr(a) * 2e3) + CombL.ar(x, 1, a, 8) / 2.1}
;Splay.ar(f ! 9 @ 8)}
