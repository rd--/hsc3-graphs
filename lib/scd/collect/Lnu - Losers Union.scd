// Feedback loop ; https://github.com/lukiss/Losers-Union-SC-Research
var i = LocalIn.ar(2, 0);
var o = Splay.ar(
	LeakDC.ar(
		DelayC.ar(
			i + ((1 + i) ** 0.999),
			1,
			SinOsc.ar(0.01 / (1 .. 8), 0).exprange(0.01, 1)
		),
		0.995
	).tanh
);
LocalOut.ar(o);
1 / 5 * LPF.ar(o, 5000)

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

({ar(Splay,ar(DelayC,ar(FreeVerb,ar(o=SinOsc,f=ar(DegreeToKey,
	Scale.aeolian.as(LocalBuf),ar(StandardN,[8,4,6,2]).range(12,48).ceil).midicps,
ar(o,3*f)*(e=perc(Env,0s1,1/8).ar(0,(m=ar(o,[8,4,1/2,1]))))**2*ar(o,1s**(..3)/16,0,2,3))*e,m.abs/2,
1-m**2*2,1-m.exprange),0.2,m.abs/2048),m@3/2)}.play)
