// zizle (jmcc) #SC3d1.5 ; texture=overlap,4,4,12,inf
{var a = {arg f; Mix.ar(SinOsc.ar(f * [Rand.new(0.7,1.3),1], [Rand.new(0,2 * pi),Rand.new(0,2 * pi)], 0.1))}
;var a1 = a.value(ExpRand.new(0.3,8)).max(0)
;var a2 = a.value(ExpRand.new(6,24)).abs
;Pan2.ar(SinOsc.ar(Rand.new(24,108).midicps, Rand.new(0,2 * pi)) * a1 * a2,Rand.new(-1,1))}
