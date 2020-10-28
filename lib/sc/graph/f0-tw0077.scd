// http://sccode.org/1-4Qy
{var a = SinOsc
;var f = a.ar(1 / [5,6]) + [798,912]
;var p = a.ar(1 / 16) * 19 + 99 * a.ar([9,8])
;var m = a.ar(a.ar(6) * a.ar(0.009))
;var b = a.ar(f,p,m)
;a.ar([201,301],b).tanh * 0.25}.play
