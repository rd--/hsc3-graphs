// Using ChaosGen.subclasses to write melodies ; https://github.com/lukiss/Losers-Union-SC-Research
var f = DegreeToKey.ar(
	[0, 2, 3, 5, 7, 8, 10].as(LocalBuf),
	GbmanN.ar([8, 4, 6, 2], 1.2, 2.1).range(8, 32).ceil,
	12
).midicps;
var m = SinOsc.ar([8, 4, 1 / 2, 1], 0);
var e = Env.perc(0.001, 1 / 8, 1, -4).ar(0, m, 1, 1, 0);
Splay.ar(
	DelayC.ar(
		FreeVerb.ar(
			SinOsc.ar(
				f,
				SinOsc.ar(3 * f, 0) * e ** 2 * (SinOsc.ar(1.1 ** (0 .. 3) / 16, 0) * 2 + 3)
			) * e,
			m.abs / 2,
			1 - m ** 2 * 2,
			1 - m.exprange(0.01, 1)
		),
		0.2,
		m.abs / 2048
	),
	m[3] / 2,
	1,
	0,
	true
)
