// f0 ; https://twitter.com/redFrik/status/1136928201886904320
{var f =
 {arg a, i
 ;var b = #[4, 2, 1, 3, 5]
 ;var c = (a.ar(1 / b, 0) * b).round(a.ar(b / 9, 0) > 0)
 ;var o = SinOscFB.ar(c ** 2 * ((a.ar(0.02, i) > 0) + 1 * 50), a.ar(c / 9, 0) % 1)
 ;var s = o * 0.max(a.ar(1 / b * a.ar(b / 99, i), 0)) * a.ar(0.01, i)
 ;var x = AllpassC.ar(s, 1, c.wrap(0.5, 1), 2)
 ;var y = BPF.ar(x, i * 99 + 400, 0.001) * (a.ar(0.04, i) + 1 * 9)
 ;Splay.ar(x + y) / 3}
;Mix.ar([LFTri, LFSaw, LFPar].collect(f))}
