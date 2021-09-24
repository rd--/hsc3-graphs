// tw 0051 (f0) - http://sccode.org/1-4Qy
{var i = Saw.ar("sunday".ascii)
;var f = Saw.ar(9 / "slow".ascii) * 400 + 500
;var w = Saw.ar(7 / "coding".ascii) + 1.1
;var l = Splay.ar(BBandPass.ar(i, f, w) / 5)
;GVerb.ar(l, 10, 3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300) * 0.2}
