// http://sccode.org/1-4Qy
{var a = Saw
;var i = a.ar("sunday".ascii)
;var f = a.ar(9 / "slow".ascii) * 400 + 500
;var w = a.ar(7 / "coding".ascii) + 1.1
;var l = Splay.ar(BBandPass.ar(i,f,w) / 5)
;GVerb.ar(l)}.play

"sunday".ascii == [115,117,110,100,97,121]
