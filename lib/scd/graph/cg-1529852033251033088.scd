// https://twitter.com/SC2Sbot/status/1529852033251033088 (cg)
Splay.ar(
	Integrator.ar(
		LFNoise0.ar(7 ! 4).round(SinOsc.kr(4, 0)),
		1
	),
	Saw.ar(
		Duty.ar(4, 0, Dseq([1, Drand([5, 10], 1), 1, Drand([11, 20], 1)], inf), 0)
	),
	1,
	0,
	true
).sin * 0.04
