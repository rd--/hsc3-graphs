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

// Broken Saws ; https://github.com/lukiss/Losers-Union-SC-Research
var c = [49, 175, 98, 147, 65, 233];
var r = 3 / 4 / (1 .. c.size);
Splay.ar(
	BPF.ar(
		VarSaw.ar(
			VarSaw.ar(r + 6, 0, 1 / 2) * 2 + c,
			0,
			VarSaw.ar(1 / r, 0, 0.5) ** 2
		) ** (VarSaw.ar(0.001 / r + 8, 0, VarSaw.ar(1 / 3, 0, 0.5).abs) * 12 + 13),
		VarSaw.ar(
			0.003 / r,
			0,
			VarSaw.ar(r * 8, 0, 0.5)
		).lag3(0.1).abs * 4000 + 80,
		1.1 - VarSaw.ar(8 * r, 0, 0.5) ** 2
	) * VarSaw.ar(r / c, 0, 0.5) / 2,
	VarSaw.ar(1, 0, VarSaw.ar(1, 0, 0.5))
) * Line.kr(0, 1, 20)

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

// Using ChaosGen.subclasses to write melodies ; https://github.com/lukiss/Losers-Union-SC-Research
var f = DegreeToKey.ar(
	[0, 2, 3, 5, 7, 8, 10].as(LocalBuf),
	StandardN.ar([8, 4, 6, 2], 1, 0.5, 0).range(12, 48).ceil,
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

// Stretching again ; https://github.com/lukiss/Losers-Union-SC-Research
var c = 16;
var f = 41;
var t = { | n | PulseDivider.ar(Impulse.ar(f, 0), c, 15 - n) } ! c;
Splay.ar(
	PlayBuf.ar(
		1,
		Buffer.read(s, Platform.resourceDir ++ "/sounds/a11wlk01.wav", 0, -1),
		LFNoise2.ar(1 ! c) * 0.1 / c + 1,
		t,
		Sweep.ar(0, MouseX.kr(0.001, 1 / 5, 1, 0.2)) % 1 * 180000,
		0,
		0
	) * Env.sine(c / f, 1).ar(0, t),
	1 / 8
)

// KaosSprinkler ; https://github.com/lukiss/Losers-Union-SC-Research
var c = 1.5 ** (0, 4 .. 12);
var e = StandardN.ar(c, 1, 0.5, 0).exprange(0.01, 1);
Splay.ar(
	LeakDC.ar(
		-12.dbamp * StandardN.ar(
			e * c * 220,
			LFDNoise3.ar(1 ! 4) * 0.1 + 0.97215,
			1 / 4,
			1 / 4
		) *	e.reverse
	),
	StandardN.ar(e.last * 14, 1, 0.5, 0)
)

// Phasing Patterns ; https://github.com/lukiss/Losers-Union-SC-Research
var f = (48 + ({ | n | [0, -5, 15, 10] + (n * 12)} ! 3).flat).midicps;
Splay.ar(
	SinOsc.ar(
		f,
		SinOsc.ar(f * 2, 0) * (SinOsc.ar(1 / f.acosh / (SinOsc.ar(1 / f, 0) * f), 0) * 8 + 8)
	) * (SinOsc.ar(1.2 ** f.normalizeSum, 0) ** 1.5 * SinOsc.ar(f.atan, 0)),
	SinOsc.ar(1 / 8, 0)
)

// Mistakes were made ; https://github.com/lukiss/Losers-Union-SC-Research
var p = 9 / 7 ** (0 .. 16);
var c = { | freq | LinCongC.ar(freq, 1.1, 0.13, 1, 0) };
var d = (c.(c.(p.atan) ** 2 * 4) ** 4 * 8).abs;
var t = c.(c.(d / p.atan).round(1 / d) ** 4 * d * 8).sin;
var f = TRand.ar(0, 64, t).ceil.midicps;
Splay.ar(
	LeakDC.ar(
		Pluck.ar(
			(SinOsc.ar(
				f * p * p.log,
				0
			) *	SinOsc.ar(f * p * p.log / 2, 0) * 2 * d).sin,
			t,
			0.1,
			t.exprange(0.01, 1) / d / p,
			(t ** 1.5 * f) * (d / p.scramble),
			(p * (1 - t.exprange(0.01, 1))).sin.exprange(0.9999,0.5)
		),
		0.995
	),
	SinOsc.ar(f / d[0], 0)
).tanh * 0.8

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

// Spa Saw Shower Wash
var c = Signal.sineFill(4096, 1 / (1 .. 128), [0]).normalize.asWavetable.as(LocalBuf);
var w = { | freq |
	LFDNoise3.ar(freq).lincurve(-1, 1, 80, 6880, LFDNoise3.kr(1) * 6)
};
var f = SinOsc.ar(
	{ Rand.ir(3.3, 4.4) } ! 6,
	0
) * 0.01 + 1 * [82, 123, 196, 147, 41, 55];
var o = Splay.ar(
	Osc.ar(
		c,
		f,
		Osc.ar(
			c,
			f * 3,
			0
		) * SinOsc.ar(1 / Rand.ir(33, 45), 0) * pi
	) / 5,
	SinOsc.ar(1 / pi, 0)
);
o = BHiPass4.ar(o, w.(1 / 7), 1) + BPF.ar(o, w.(1 / 5), 1) + MoogFF.ar(o, w.(1 / 3), 2, 0);
4.do {
	o = AllpassC.ar(o, 1, { Rand.ir(1 / 16, 1 / 32) } ! 2, 1)
};
o

// Suspect jazz ; https://github.com/lukiss/Losers-Union-SC-Research
var x = HenonL.ar(1 + LFDNoise1.kr(3).exprange(0.01, 1) * 8, 1.4, 0.3, 0, 0).fold2(1);
var t = { | n | PulseDivider.ar(x, 8, 7 - n) } ! 8;
var d = 1.5 + x.exprange(0.01, 1);
var e = { | c | Env.perc(0.004, d, 1, c).ar(0, t) };
var c = [0, 3, 7, -2];
var f = Demand.ar(
	t,
	0,
	Drand(c, inf) + Dxrand(48 + ({ | o | o * 12 + c } ! 3).flat, inf)
).midicps;
var o = SinOsc.ar(
	(BrownNoise.ar() * 0.015 + 1) * f,
	(BrownNoise.ar() / 4 * SinOsc.ar([3.25, 0.5, 2] * f, 0) * e.(-28)).sum
) * e.(-6) * (SinOsc.ar(d + 2, 0) * 0.25 + 0.5);
Splay.ar(o, 1 / 4)

// Phase Modulation Washer ; https://github.com/lukiss/Losers-Union-SC-Research
var p = (1, 3 .. 64);
var n = 110;
var f = p / pi * p.degrad * n;
Splay.ar(
	PMOsc.ar(
		f,
		f * 2,
		SinOsc.ar(f / n, 0) * SinOsc.ar(n / f, 0) * 2,
		SinOsc.ar(3 / p, 0) * pi
	) * SinOsc.ar(1 / p, 0),
	SinOsc.ar(SinOsc.ar(0.1 / n, 0) * 8, 0) / SinOsc.ar(1 / n, 0) / 2
)

// Something awfully old ; https://github.com/lukiss/Losers-Union-SC-Research
var a = LocalBuf(8 * 2048, 1);
var f = { LFDNoise3.kr(0.001 ! 7).tan.abs };
RecordBuf.ar(LFDNoise3.ar(500) + (PinkNoise.ar() * 8), a, 0, 1, 0, 1, 0, 1, 0);
Splay.ar(
	LeakDC.ar(
		CombC.ar(
			Warp1.ar(1, a, f, f * 0.03, Array.series(4, 1 / 7, 1 / 7) * 0.12, -1, 4, 0, 4),
			0.4,
			0.4,
			2
		).softclip,
		0.995
	)
)

// Drone for the Evening ; https://github.com/lukiss/Losers-Union-SC-Research
var p = (1, 3 .. 64);
var f = { (LFDNoise1.ar(8) / 16 + 33).midicps };
var c = p ** (p / p.sum).atan * f * p;
Splay.ar(
	SinOsc.ar(
		c,
		SinOsc.ar(c * 3, 0) * SinOsc.ar((SinOsc.ar(p / c, 0) * 8 + 8) / c, 0) * pi
	) *	SinOsc.ar(p / c, 0),
	SinOsc.ar(1 / 3, 0) * SinOsc.ar(1 / 32, 0)
)
