// tw 0014 (f0) ; https://twitter.com/redFrik/status/24193534033
{var f =
 {arg i
 ;var a = SinOscFB
 ;var a0 = a.ar(i+1, 1/9) * 999
 ;var a1 = a.ar(1/9, 1) / 9
 ;var a2 = a.ar(a0, 1/9) * a1
 ;var a3 = a.ar(0.1, 3)
 ;var a4 = a.ar(a2, a3) * (i + 2 * 999)
 ;var a5 = a.ar(1/9, 1/9)
 ;a.ar(a4, a5) / 9}
;f.dup(9).sum.dup(2) * 0.35}