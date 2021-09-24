// zizle (jmcc) #SC3d1.5 ; texture=overlap,4,4,12,inf
{var a, a1, a2, o
;a =
 {arg f
 ;Mix.ar(SinOsc.ar(freq: f * [Rand.new(0.7,1.3),1], phase: [Rand.new(0,2 * pi),Rand.new(0,2 * pi)], mul: 0.1))}
;a1 = a.value(ExpRand.new(lo: 0.3, hi: 8))
;a2 = a.value(ExpRand.new(lo: 6, hi: 24))
;o = SinOsc.ar(freq: Rand.new(lo: 24, hi: 108).midicps, phase: Rand.new(lo: 0, hi: 2 * pi)) * a1.max(0) * a2.abs
;Pan2.ar(in: o, pos: Rand.new(lo: -1, hi: 1))}
