// http://twitter.com/headcube/status/474064500564324352 (nv)
{var p = {LFPulse.ar(2 ** rrand(-9,1), 2.rand / 2)}
;var q = {arg i; product(p ! (i + 2)) / (1 + i) + 1}
;var s = {var f = product(q ! 8) * 86
         ;Pluck.ar(BPF.ar(f, f).sin, Saw.ar, 1, 1 / f, 9)}
;Splay.ar(s ! 9) * 0.1}
