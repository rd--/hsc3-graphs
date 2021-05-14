// zizle (jmcc) #SC3d1.5 ; texture=overlap,4,4,12,inf
{var a = {arg f; Mix.ar(SinOsc.ar(f * [Rand(0.7,1.3),1], [Rand(0,2pi),Rand(0,2pi)], 0.1))}
;var a1 = a.value(ExpRand(0.3,8)).max(0)
;var a2 = a.value(ExpRand(6,24)).abs
;Pan2.ar(SinOsc.ar(Rand(24,108).midicps, Rand(0,2pi)) * a1 * a2,Rand(-1,1))}
