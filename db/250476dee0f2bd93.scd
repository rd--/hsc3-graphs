// https://sccode.org/1-50L (mk)
var z =  PinkNoise.ar();
var lfo = { arg rt; LFPulse.ar(rt ! 2, 0, 0.5) };
16.do{
	z = BRF.ar(
		z,
		Rand(100, 15000) * (0.75 + (lfo.value(Rand(0, 0.5)) * 0.25)),
		lfo.value(Rand(0, 0.5)).range(0.05, 1)
	)
};
z
