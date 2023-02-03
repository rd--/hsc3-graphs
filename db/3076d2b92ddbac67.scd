// https://sccode.org/1-50L (mk)
var z = PinkNoise.ar();
var lfo = { arg rt;	LFNoise1.ar(rt ! 2) };
16.do{
	z = BRF.ar(
		z,
		Rand.ir(100, 15000) * (0.75 + (lfo.value(Rand.ir(0, 8)) * 0.25)),
		lfo.value(Rand.ir(0, 8)).range(0.05, 1)
	)
};
z
