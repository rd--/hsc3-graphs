// wind metals (jmcc) ; texture=overlap,5,2,12,inf
{var n = 6
;var base = ExpRand(60,4000)
;var rng = Rand(500.0,8000.0)
;var n0 = BrownNoise.ar([0.007,0.007])
;var r0 = ExpRand(0.125,0.5)
;var n1 = LFNoise1.kr(r0,0.75,0.25)
;var exc = n0 * max(0,n1)
;var f = Array.fill(n,{Rand(0,rng) + base})
;var dt = Array.fill(n,{Rand(0.1,2.0)})
;var s = Klank.ar(`[f,nil,dt],exc)
;(s * 0.1).softclip}
