// Grains, Daily ; https://github.com/lukiss/Losers-Union-SC-Research
var m = { | lo hi |
	StandardL.ar(LFDNoise1.ar(1).exprange(0.01, 1) * 8 + 0.1, 2, 0.5, 0).exprange(lo, hi)
};
var f = {
	StandardL.ar(m.(1, 128), m.(1, 3), 0.5, 0).exprange(40, 5000)
};
LeakDC.ar(
	GrainFM.ar(
		2,
		Impulse.ar(f / m.(0.5, 8), 0),
		m.(0.1, 4) / f,
		f,
		m.(1 / 4, 4) * f,
		m.(1 / 4, 4),
		StandardL.ar(f / 2, 1, 0.5, 0) / 2,
		Buffer.sendCollection(s, Env.perc(0.001, 1).discretize),
		1024
	),
	0.995
).softclip
