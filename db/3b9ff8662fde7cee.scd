// wind metals (jmcc) ; texture=overlap,5,2,12,inf
{var n = 6
;var base = ExpRand.ir(60, 4000)
;var rng = Rand.ir(500.0, 8000.0)
;var n0 = {BrownNoise.ar}.dup * 0.007
;var r0 = ExpRand.ir(0.125, 0.5)
;var n1 = LFNoise1.kr(r0) * 0.75 + 0.25
;var exc = n0 * 0.max(n1)
;var f = Array.fill(n, {Rand.ir(0, rng) + base})
;var dt = Array.fill(n, {Rand.ir(0.1, 2.0)})
;var s = Klank.ar(Ref.new([f, nil, dt]), exc)
;(s * 0.1).softclip}
