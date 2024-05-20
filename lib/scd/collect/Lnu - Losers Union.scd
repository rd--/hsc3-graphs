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
LPF.ar(o <! LocalOut.ar(o), 5000) / 5

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
	{ Rand(3.3, 4.4) } ! 6,
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
		) * SinOsc.ar(1 / Rand(33, 45), 0) * pi
	) / 5,
	SinOsc.ar(1 / pi, 0)
);
o = BHiPass4.ar(o, w.(1 / 7), 1) + BPF.ar(o, w.(1 / 5), 1) + MoogFF.ar(o, w.(1 / 3), 2, 0);
4.do {
	o = AllpassC.ar(o, 1, { Rand(1 / 16, 1 / 32) } ! 2, 1)
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
var w = RecordBuf.ar(LFDNoise3.ar(500) + (PinkNoise.ar() * 8), a, 0, 1, 0, 1, 0, 1, 0);
Splay.ar(
	LeakDC.ar(
		CombC.ar(
			Warp1.ar(1, a, f, f * 0.03, Array.series(4, 1 / 7, 1 / 7) * 0.12, -1, 4, 0, 4) <! w,
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

// Tw 14 Nov 2022 Ballad ; https://github.com/lukiss/Losers-Union-SC-Research
var d = Dseq((1, 3 .. 21), inf);
var f = Ddup(
	LFPar.ar(0.05, 0) * d / [3, 7, 5, 1],
	Dseq((9 .. 42).degreeToKey(Scale.phrygian, 12), inf).midicps
);
Splay.ar(
	LeakDC.ar(
		GrainFM.ar(
			2,
			TDuty.ar(1 / d, 0, 1, 0, 0),
			2 + LFPar.ar(0.3, 0) / d * 2,
			[2, 3],
			f,
			f % d / 12,
			LFPar.ar(440, 0) / 2,
			Buffer.sendCollection(s, Env.perc.discretize(1024)),
			512
		) * 0.23,
		0.995
	)
).sum

// 12 May 2020 ; https://github.com/lukiss/Losers-Union-SC-Research
var l = { | freq mul |
	(LFDNoise3.kr(freq) * mul).abs
};
var i = 1 / 16;
var t = Impulse.kr(l.(pi, pi), 0);
CombC.ar(
	Splay.ar(
		{
			SinOsc.ar(
				Demand.kr(
					t,
					0,
					Drand((9 .. 42).degreeToKey([0, 2, 4, 7, 9], pi * pi),inf)
				).midicps,
				0
			) * (t.lag3ud(0, i) + (t.lag3ud(i + l.(9, i * 4), l.(pi, pi)) / pi))
		} ! 5
	),
	i,
	i,
	pi
)

// 9 Jan 2019 ; https://github.com/lukiss/Losers-Union-SC-Research
var a = 40;
var f = { | b |
	LFNoise1.kr(1).exprange(10, b)
};
Splay.ar(
	LeakDC.ar(
		Formant.ar(
			({ a = a + 5 } ! 6).midicps * ({ f.(29).round(7) } ! 6).midiratio,
			{ f.(1000) } ! 6,
			{ f.(500) } ! 6
		),
		0.995
	)
) / 13

// 3 Nov 2018 ; https://github.com/lukiss/Losers-Union-SC-Research
var a = 9;
var f = { | b |
	LFNoise2.kr(b.sign).exprange(9, b)
};
Splay.ar(
	LeakDC.ar(
		Formant.ar(
			({ a = a + 7 } ! 6).midicps * ({ f.(99).round(12) } ! 6).midiratio,
			{ f.(2200) } ! 6,
			{ f.(300) } ! 6
		) * SinOscFB.kr(
			f.(0.05),
			{ f.(0.5) } ! 6
		),
		0.995
	)
) / 13

// 22 Maj 2021 ; https://github.com/lukiss/Losers-Union-SC-Research
var n = 4;
var l = { | mul |
	(LFDNoise3.kr(0.05 ! n) * mul).abs
};
var d = {
	Demand.ar(
		Impulse.ar(1 / (30 .. 53).choose, 0),
		0,
		Dxrand((7 .. 53).degreeToKey([0, 1, 4, 5, 7, 9, 10], 12).midicps, inf)
	)
};
Splay.ar(
	HPF.ar(
		CombC.ar(
			PMOsc.ar(
				d ! n,
				d ! n,
				l.(2),
				l.(0.5)
			) * (l.(0.25) + 1 / 4),
			1 / 4,
			1 / 4 - l.(1 / 16),
			7
		),
		110,
	) * -12.dbamp
)

// 30 Apr. 2020 ; https://github.com/lukiss/Losers-Union-SC-Research
var t = {
	TDuty.kr(Drand((1 .. 8) / 16, inf), 0, 1)
};
var r = { | lo hi |
	TRand.kr(lo, hi, t);
};
Normalizer.ar(
	CompanderD.ar(
		LeakDC.ar(
			LorenzL.ar(
				22050,
				r.(19, 11),
				r.(1, 18),
				r.(0.1, 5),
				r.(0.01, 0.06 ! 2),
				0.1,
				0,
				0
			),
			0.995
		),
		0.8,
		r.(0.01, 0.5),
		r.(0.01, 0.5),
		0.01,
		0.075
	),
	-2.dbamp,
	0.02
).fold2(0.8)

// 22 Nov. 2021 ; https://github.com/lukiss/Losers-Union-SC-Research
var n = {
	1 + ((0.00001 * (1 .. 7))).scramble
};
Splay.ar(
	VarSaw.ar(
		33 * n.(),
		0,
		LFSaw.ar(1 / 3 * n.(), 0) * LFSaw.ar(n.() / 3, 0)
	) * (LFSaw.ar(5 / 3, 0) * (LFSaw.ar(7 / 3 * n.().neg, 0).tan)).abs
).tanh

// 12 Juli 2019 ; https://github.com/lukiss/Losers-Union-SC-Research
var f = { | freq mul |
	var z = LFDNoise3.kr(freq) * mul;
	z.ring1(z % 0.01).hypot(z)
};
var o = Formant.ar(
	f.(f.(3, 13), 220),
	f.(f.(2, 10), f.(f.(3, 13), 2320)),
	f.(f.(3, 5), 2500)
);
var a = {
	f.(f.(2, 12), 1).excess(f.(f.(1, 14), f.(4.4, 0.5) + 0.3))
} ! 2;
(o * a).softclip

// 5 Sep. 2020 ; https://github.com/lukiss/Losers-Union-SC-Research
var l = {
	LFDNoise3.kr(1).abs
};
var r = { | freq mul |
	(Gendy3.kr(6, 6, l, l, freq, l, l, 5, l * 5) * mul).abs
};
-12.dbamp * Splay.ar(
	(0 .. 5).collect { | n |
		CombC.ar(
			LeakDC.ar(
				FM7.ar(
					{
						[
							80.rand.midicps,
							0,
							Blip.kr(r.(l, 24), r.(l, 228)).abs
						]
					} ! 6,
					r.(0.02,0.5) ! 6 ! 6
				)[n],
				0.995
			),
			0.5,
			0.05 + r.(0.04,l),
			1
		)
	}
)

// Ambient Ligeti inspired soundscape ; https://github.com/lukiss/Losers-Union-SC-Research
var r = { | n |
	{ LFDNoise3.ar(1 / 86).abs } ! n
};
Splay.ar(
	LeakDC.ar(
		FreeVerb.ar(
			Warp1.ar(
				1,
				Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav"),
				r.(9),
				[-36, -9, -14, 0, -19, -5, 3, -2, -24, -7].midiratio,
				8 * r.(9) + 8 / 86,
				-1,
				12,
				1 / 4 * r.(9),
				4
			) * r.(9),
			r.(9),
			0.5 + r.(9)
		) *	r.(9),
		0.995
	),
	2 / 4
).tanh * Line.kr(0, 1, 12)

// 27 Jan 2023 ; https://github.com/lukiss/Losers-Union-SC-Research
var d = Dust.kr(1);
var m = {
	TRand.kr(0.5, 2.5, d).lag3(1 / 16)
};
var c = (0 .. 9).collect { | n |
	m.() ** n
};
var n = c / c.sum;
var e = TChoose.kr(
	Dust.kr(1 + m.()),
	[
		c.sum,
		n,
		c.round(32),
		n.atan2(m.()),
		c.sin,
		c.tan,
		n.hypot(c)
	]
);
var a = ((LFSaw.ar(c.tan / m.(), 0).abs ** e.max(0)).log10.sin.abs ** 10).tanh;
Splay.ar(
	SinOsc.ar(c.log10 * c, 0) * a,
	SinOsc.ar(m.() * m.(), 0) * 0.5
)

// 27 Oktober 2022 ; https://github.com/lukiss/Losers-Union-SC-Research
var a = [41, 73, 123, 196];
var f = SinOsc.ar(440, 0);
(0 .. 8).do { | i |
	a = a * 5.midiratio;
	f = SinOsc.ar(f * a.rotate(i + 3), 0) * SinOsc.ar(f, 0).tanh
};
Splay.ar(
	LeakDC.ar(
		f.tanh
	),
	SinOsc.kr(f.sum.abs, 0)
)

// 23 Mars ; https://github.com/lukiss/Losers-Union-SC-Research
var d = { | n |
	{
		Gendy3.kr(1, 1, 1, 1, LFNoise1.kr(2) + 1, 0.5, 0.5, 12, 12).abs.round(1 / 16)
	} ! n
};
var t = Dust.kr(d.(5) / 2);
Splay.ar(
	FreeVerb.ar(
		LeakDC.ar(
			IFFT.ar(
				PV_BinScramble(
					FFT(
						{ LocalBuf(4096, 1) } ! 2,
						StandardL.ar(d.(2) * 5000, 1, 0.5, 0),
						0.5,
						0,
						1,
						0
					),
					d.(1),
					d.(1),
					t
				),
				0,
				0
			) * t.lag3ud(0.01, d.(5)),
			0.995
		),
		d.(1) / 3,
		d.(1),
		d.(1) / 2
	),
	0.5
)

// 20 jan. 2023 ; https://github.com/lukiss/Losers-Union-SC-Research
var l = { | lo hi |
	TChoose.ar(
		Dust.ar(3 ! 2),
		CuspN.ar(1.1 ** (0 .. 5), 1, 1.9, 0).tanh
	).exprange(lo, hi)
};
var a = ({ l.(0.001, 1) } ! 3).perfectShuffle ++ ({ l.(1, 0.001) } ! 3);
var f = l.(12, 999);
var e = EnvGen.ar(Env(a, a / a.sum, a.neg * 9).circle(0, 'lin'), 1, 1, 0, 1 / f, 0);
var g = EnvGen.ar(Env.perc(0.005, 0.9 / f), e > 0.1, 1, 0, 1, 0);
Splay.ar((e.blend((e * f).sin, 1 - g) + g).tanh)

// Cheap Singing Synth ; simpler (rd) ; https://github.com/lukiss/Losers-Union-SC-Research
var tab = [
	[[600,1040,2250,2450,2750], [60,70,110,120,130], [0,-7,-9,-9,-20]],
	[[400,1620,2400,2800,3100], [40,80,100,120,120], [0,-12,-9,-12,-18]],
	[[250,1750,2600,3050,3340], [60,90,100,120,120], [0,-30,-16,-22,-28]],
	[[400,750,2400,2600,2900], [40,80,100,120,120], [0,-11,-21,-20,-40]],
	[[350,600,2400,2675,2950], [40,80,100,120,120], [0,-20,-32,-28,-36]],
];
var x = LorenzL.ar(24, 10, 28, 2.667, 0.05, 0.1, 0, 0).sin.range(1, 4) / Diwhite(2, 10, inf);
var dur = Duty.kr(x, 0, x, 0);
var trg = TDuty.kr(dur, 0, 1, 0, 0);
var mel = (26 .. 42).degreeToKey(Scale.choose, 12);
var mnn = Demand.kr(
	trg,
	0,
	Dseq(mel.scramble, inf)
);
var env = Env.adsr(dur / 48, 1 / 4, 1, dur / 2, 1.2, -4, 0.01).kr(
	0,
	Trig.kr(trg, dur * LFNoise2.ar(4).range(0.5, 1))
);
var voc = SelectXFocus.kr(
	mnn.linlin(mel[0], mel.last, 0, tab.size),
	tab,
	0.9,
	true
);
var atk = PinkNoise.ar() * (1 - env);
var sus = LFNoise2.kr(voc[1]) * ((env - voc[2].dbamp) / 2) + voc[0];
Splay.ar(
	BPF.ar(
		SyncSaw.ar(
			LFNoise2.ar(voc[1]) * mnn / (voc[0]) + mnn.midicps,
			atk + sus
		),
		env - Env.perc(0, 1 / (2 ** (0 .. 5)) / 8, 0.5, -4).kr(0, trg) * voc[0] + 30,
		(voc[1] / voc[0])
	).softclip * voc[2].dbamp * env
)

// ---- Tennis ; https://github.com/lukiss/Losers-Union-SC-Research
var nf = s.sampleRate;
var b = Buffer.alloc(s, nf, 1, nil, 1000); // var b = LocalBuf(nf, 1);
var n = LeakDC.ar(
	StandardL.ar(22050, LFNoise1.ar(1).range(0.72, 1.40), 0.5, 0),
	0.995
);
var z = Sweep.ar(0, 1 - n.exprange(0.01, 1)) % 1 * nf;
var t = (n.lag3(0.1) > 0);
var w = RecordBuf.ar(n, b, z, t, 1 - t, t, 1, t, 0);
var p = PlayBuf.ar(
	1,
	b,
	(1 - n.round(1 / 16)) / TRand.ar(1 , z / 100, t).lag3(0.001),
	t,
	z,
	1,
	0
) <! w;
Pan2.ar(
	LeakDC.ar(
		MoogFF.ar(
			p,
			p.exprange(0.01, 1) * 11025,
			2,
			0
		),
		0.995
	).softclip,
	TRand.ar(-1, 1, t),
	1
)

