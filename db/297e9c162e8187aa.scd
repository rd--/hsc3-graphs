// zizle (jmcc) #SC3d1.5 ; texture=overlap,4,4,12,inf
var a = { arg f; Mix.ar(SinOsc.ar(f * [Rand.ir(0.7,1.3),1], [Rand.ir(0,2 * pi),Rand.ir(0,2 * pi)], 0.1)) };
var a1 = a.value(ExpRand.ir(0.3,8)).max(0);
var a2 = a.value(ExpRand.ir(6,24)).abs;
Pan2.ar(SinOsc.ar(Rand.ir(24,108).midicps, Rand.ir(0,2 * pi)) * a1 * a2,Rand.ir(-1,1))
