// zizle (jmcc) #SC3d1.5 ; texture=overlap,4,4,12,inf
var a = {
	arg f;
	Mix.ar(SinOsc.ar(f * [Rand(0.7,1.3),1], [Rand(0,2 * pi),Rand(0,2 * pi)], 0.1))
};
var a1 = a.value(ExpRand(0.3,8)).max(0);
var a2 = a.value(ExpRand(6,24)).abs;
Pan2.ar(SinOsc.ar(Rand(24,108).midicps, Rand(0,2 * pi)) * a1 * a2,Rand(-1,1))

//---- zizle (jmcc) #SC3d1.5 ; texture=overlap,4,4,12,inf ; keywords
var a = {
	arg f;
	Mix.ar(SinOsc.ar(freq: f * [Rand(0.7,1.3),1], phase: [Rand(0,2 * pi),Rand(0,2 * pi)], mul: 0.1))
};
var a1 = a.value(ExpRand(lo: 0.3, hi: 8));
var a2 = a.value(ExpRand(lo: 6, hi: 24));
var o = SinOsc.ar(freq: Rand(lo: 24, hi: 108).midicps, phase: Rand(lo: 0, hi: 2 * pi)) * a1.max(0) * a2.abs;
Pan2.ar(in: o, pos: Rand(lo: -1, hi: 1))

