// http://sccode.org/1-Z (jl)
{var a = Impulse.kr(8,0).lag(0.1)
;var b = Crackle.ar(LFSaw.kr(3,0).abs.lag(0.1) * 1.8)
;var c = a * b
;var d = (Impulse.kr(2,0) + Impulse.kr(4,0.5)).lag(0.1)
;var e = Blip.ar(4.9,7) * 0.4
;var f = d * e
;tanh(c + GVerb.ar(f,1,1,0.5,0.5,15,1,0.7,0.5,300) * 5) * 2}
