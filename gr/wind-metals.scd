{var n = 6
;var base = ExpRand.new(60,4000)
;var rng = Rand.new(500.0,8000.0)
;var n0 = BrownNoise.ar([0.007,0.007])
;var r0 = ExpRand.new(0.125,0.5)
;var n1 = LFNoise1.kr(r0,0.75,0.25)
;var exc = n0 * max(0,n1)
;var f = Array.fill(n,{Rand.new(0,rng) + base})
;var dt = Array.fill(n,{Rand.new(0.1,2.0)})
;var s = Klank.ar(`[f,nil,dt],exc)
;Out.ar(0,(s * 0.1).softclip)}.play