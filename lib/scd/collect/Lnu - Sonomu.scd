// https://sonomu.club/@lukiss/109545370818142871
var l = { LFNoise2.ar(3 ! 6) / 99 + 2 };
var f = Demand.ar(Dust.ar(2 * l.value.frac), 0, Dseq((1, 3 .. 38).degreeToKey(Scale.aeolian), inf)).midicps;
var o = DelayC.ar(LeakDC.ar(LocalIn.ar(1, 0) + Dust.ar(1), 0.995), 1, { |n| 2 ** n } ! 6 * l.value / f);
Splay.ar(LPZ2.ar(o) / 5) <! LocalOut.ar(o.sum.softclip)

// https://sonomu.club/@lukiss/112406789401906049
var m = {
	LFDNoise3.kr(1 / 7).exprange(0.01, 1.0)
};
var d = { |a p|
	TDuty.ar(Dseq(a.pyramid(p), inf) / 8.3, 0, 1, 0, 0)
};
var q = (1 .. 5) ++ [11, 9];
var a = [
	m.value > 0.05 * d.value((4 ! 7) ++ [16, 8], 3).lag3(0, 0.005),
	HPF.ar(m.value > 0.05 * d.value(q, 5), 7777),
	m.value > 0.05 * d.value(q, 5),
	3 / 5 * (m.value > 0.1) * d.value((1..5) ++ [3, 9], 6).lag3(1E-5, 1E-3),
	0.5 * (m.value > 0.05) * d.value(q, 7).lag3(1E-7, 1E-3)
];
var b = GVerb.ar(
	a,
	[1, 2, 2, 1, 2],
	[2, 8, m.value * 4, 9, 6],
	[0.95, m.value, m.value, 0.9, 1 - m.value],
	0.5, 15, 1, 0.7, 0.5, 300
);
var o = Splay.ar(m ! 4 * b);
var p = CompanderD.ar(o, 1 / 2, 1 / 3, 1 / 2, 0.01, 0.1) / 3;
(o / 3 + p).softclip.flop.sum

// https://sonomu.club/@lukiss/112280811322923333
var f = [77, 777, 7777];
var a = (GbmanL.ar(f, 1.2, 2.1).sin + 1 * 2).ceil / 9;
var e = { |f|
	var t = Duty.ar(a, 0, a, 0);
	Env.perc(0.001, t, 1, -4).ar(0, TDuty.ar(t, 0, 1, 0, 0))
};
Splay.ar(
	SinOsc.ar(f, 0) * (e.value(f / 7) ** [2, 6, 10]) * [1, 1 / 3, 1 / 9],
	SinOsc.ar((e.value(7) * 7), 0)
).flop.sum

// https://sonomu.club/@lukiss/112090216321959038
var m = {
	FBSineL.ar(
		LFDNoise1.ar(2).exprange(0.01, 1) * 14 + 0.5,
		1, 0.1, 1.1, 0.5, 0.1, 0.1
	).lag3(0.1).sin.exprange(0.01, 1)
};
var g = Dust.ar(m.value + m.value * 6);
var r = LFDNoise1.ar(2).exprange(0.01, 1) / 8;
var e = Env.perc(0.001, r, 1, -4).ar(0, g);
var o = FBSineL.ar(
	1 - m.value * 5888 + 88,
	m.value * 3,
	m.value ** 2,
	m.value + 1,
	m.value / 2,
	0.1,
	0.1
);
var c = CombC.ar((e * o).sin.softclip, 1, 0.001 + m.value, m.value * 8).sin * 0.9 + (PinkNoise.ar() * -64.dbamp);
var l = LeakDC.ar(c, 0.995);
var v = GVerb.ar(
	l.sin,
	5,
	m.value * 8 + 1,
	1 - (m.value ** 2),
	1 / 2,
	29,
	1,
	m.value,
	1 - m.value,
	m.value * 215
);
Splay.ar((v + l).softclip * -6.dbamp)

// https://sonomu.club/@lukiss/112015967098344604
var f = 111 * Scale.phrygian('wcHarm')[(0..7)].midiratio;
var e = {
	LFSaw.ar(GrayNoise.ar() * (1 / 7 ! 8) - 7, 0).lag3(0.001).max(0)
};
var v = SinOsc.ar(1 - e.value / f, 4) + 1 / 2 ** 2;
var p = LFPulse.ar(
	f @ (7 .. 1) / 111,
	0,
	1 - v
) * [1, 2, 4];
var o = VarSaw.ar(
	f + (p * f),
	0,
	1 - e.value ** 2 / 2
) * (p.rotate(2) - e.value @ (7 .. 0) ** 0.125);
var r = FreeVerb.ar(
	BPF.ar(
		o * e.value ** 2,
		1 - e.value * v * 11111 + 111,
		1.1 - v
	),
	1 - v,
	v @ (7 .. 0),
	0.999
) * (1 - (e.value ** 4)) + (e.value * v * o);
Splay.ar(r, (v @ 7 * 111).sin)

// https://sonomu.club/@lukiss/111583491682015266
var t = { |z|
	LFSaw.ar(z, 1) + 1 / 2
};
var r = 2 ** (GbmanN.ar(t.value(-1 / 60) * 4 + 4, 1.2, 2.1).sin * (t.value(1 / 4) * 2 + 2)).floor.abs;
var c = (0 .. 5).collect { |n| n * 12 + [2, 15, 7, 12] }.flat;
var o = VarSaw.ar(
	10 * pi * c.midiratio,
	0,
	t.value(r) / 2
) * ((t.value(r) ** ((t.value(r / 2) * 4) + 1).abs * c).log.sin.max(0).sin.max(0) ** 8);
var e = t.value(-1 * r) > (t.value(pi / r) / 1.5 + 0.05);
BBandStop.ar(
	Splay.ar(
		o * e,
		LFTri.ar(r, 0)
	),
	t.value(r / 8).linexp(0, 1, 80, 5500),
	t.value(1 / 9) * 2 + 3
)

// https://social.ordinal.garden/@f0/111583733632579377 (f0 + lnu)
var t = { |z|
	LFSaw.ar(z, 1) + 1 / 2
};
var r = 2 ** (GbmanN.ar(t.value(-1 / 60) * 4 + 4, 1.2, 2.1).sin * (t.value(1 / 4) * 2 + 2)).floor.abs;
var c = (0 .. 5).collect { |n| n * 12 + [2, 15, 7, 12] }.flat;
var o = VarSaw.ar(
	t.value(1 / 13) < 0.5 * 2 + 8 * pi * c.midiratio,
	0,
	t.value(r) / 2
) * ((t.value(r) ** ((t.value(r / 2) * 4) + 1).abs * c).log.sin.max(0).sin.max(0) ** 8);
var e = t.value(-1 * r) > (t.value(pi / r) / 1.5 + 0.05);
var x = BBandStop.ar(
	Splay.ar(
		o * e,
		LFTri.ar(r, 0)
	),
	t.value(r / 8).linexp(0, 1, 80, 5500),
	t.value(1 / 9) * 2 + 3
);
CombN.ar(
	RLPF.ar(x, 800, 0.1),
	1,
	4 / 13,
	4
) / 2 + x

// https://sonomu.club/@lukiss/111577779507616435
var r = { | a b |
	var t = HenonL.ar(LFNoise2.ar(1).exprange(0.01, 1) * 16, 1.4, 0.3, 0, 0);
	TRand.ar(a, b, t)
};
var t = Sweep.ar(0, r.value(-1E3, 1E3)) % r.value(28, 512);
var b = (t & r.value(64, 256)) | (t >> r.value(4, 18));
LeakDC.ar(
	0.5 * LFTri.ar(b.midicps % 1E4, 0) * (b > 32).lag3(0.1),
	0.995
) ! 2

// https://sonomu.club/@lukiss/11153496993558134
var p = {
	var a = (0 .. 3).collect { | n |
		n * 12 + [0, 3, 7, 10]
	}.flat - 24;
	SinOsc.ar(5, 0) * 0.01 + a.scramble.midiratio
};
var e = LFSaw.ar(-1 * p, 1).max(0) ** SinOsc.ar(p.value.frac / 8, 0).linlin(-1, 1, 4, 32);
CombC.ar(
	Splay.ar(
		VarSaw.ar(
			147 * p.value,
			0,
			LFSaw.ar(
				p.value.degrad,
				1
			) * (1 / 4) + (1 / 4)
		) * e.sanitize,
		SinOsc.ar(1 / 3, 0)
	),
	0.2, 0.2, 1
)

// https://sonomu.club/@lukiss/111534001937293189
var t = TDuty.kr(1 / (2 ** Diwhite(0, 8, inf)), 0, 1, 0, 0);
var l = {
	var z = nil;
	TChoose.kr(
		t,
		(0 .. 7).collect { | n |
			z = ((LFDNoise1.kr(4) + 2 ** n) / 16);
			SinOsc.kr(z, 0).sin
		}
	).lag(0.25 / z)
};
var p = (1 .. 32);
var e = LFSaw.ar(l.value * p.midiratio, 1) * 0.5 + 0.5 ** 8;
Splay.ar(
	LeakDC.ar(
		Blip.ar(
			p * p.midiratio * TChoose.kr(t, 2 * p.midicps),
			LFSaw.kr(l.value, 1).lincurve(-1, 1, 1, LFSaw.kr(l.value * p.degrad, 1) * 200 + 201, 8)
		) * e,
		0.995
	) * 0.25,
	l.value
)

// https://sonomu.club/@lukiss/109875835273563824
var f = { | rt | Sweep.ar(0, rt) };
var t = f.value(4E4);
var c = f.value(1);
var r = (1 .. 5);
var b = (-1 * [24, 5, 0, 10, 8, 15].midiratio * t) & ((r + c).wrap(1, 3333)) & (t >> 105);
var e = b.lincurve(0, 127, -1, 1, -8).fold2(1) / 2;
Splay.ar(
	FreeVerb.ar(
		LFSaw.ar(-1 * r, 2).max(0).lag3(0.1) * LeakDC.ar(e, 0.999),
		1 / 3,
		c.sin.max(0),
		LFSaw.ar(c.cos, 0)
	),
	c.sin
)

// https://sonomu.club/@lukiss/109733997253009229 ; Jan 23, 2023
var c = (9, 12 .. 61).degreeToKey(Scale.choose);
var o = c.midicps.collect { | f | SinOsc.ar(f, 0) };
var e = SinOsc.ar(2 / c.log10, 0) * LFSaw.ar(11 / c.neg, 0).max(0).lag3(0.1);
Splay.ar(
	LeakDC.ar(o * e, 0.995),
	SinOsc.ar(1 / c @ 0, 0)
)

// https://sonomu.club/@lukiss/110281639162399169
var m = Impulse.kr(8, 0);
var c = { | a |
	var z = [];
	a.collect { | each |
		z = z.add(each.asBinaryDigits).flatten
	};
	Demand.kr(m, 0, Dseq(z, inf))
};
var p = m * [
	c.value([136, 138]),
	c.value([8, 9, 8, 72, 8, 72, 9]),
	c.value([140, 148, 34]),
	c.value([178, 58]),
	c.value([34])
];
var e = { | g |
	Linen.kr(g, 0.01, 1, 1, 0)
};
var h = HenonC.ar(1 / (1 .. 5), 1.4, 0.3, 0, 0) < 0.9;
Splay.ar(
	h * [
		LFTri.ar(e.value(p @ 0) ** 18 * 133 + 80, 0) * (e.value(p @ 0) ** 24),
		HenonC.ar(e.value(p @ 1) ** 8 * 800 + 4E3, 1.4, 0.3, 0, 0) * (e.value(p @ 1) ** 38),
		LFTri.ar(2E3, 0) * HenonC.ar(1E4, 1.4, 0.3, 0, 0) * (e.value(p @ 2) ** 5 ** 16),
		LFTri.ar(110, 0) * LFTri.ar((ToggleFF.kr(p @ 3) * 7).midiratio * 220, 0) * (e.value(p @ 3) ** 5 ** 8),
		0.3 * HenonC.ar(22050, 1.4, 0.3, 0, 0) * (e.value(p @ 4) ** 68 + (0.5 * e.value(p @ 4) ** 3))
	],
	0.25
)

// https://sonomu.club/@lukiss/111422385501420073
var x = CuspL.ar(CuspL.ar(3, 1, 1.9, 0).exp * 12 + 1, 1, 1.9, 0).fold2(1);
var t = (0 .. 7).collect { | n | PulseDivider.ar(x, 8, 7 - n) };
var d = x.linlin(-1, 1, 1 / 2, 2);
var e = { | c |
	Env.perc(0.001, d, 1, c).ar(0, t)
};
var c = [0, 3, 7, -2];
var f = Demand.ar(
	t,
	0,
	Dseq(c, inf) + Dxrand(48 + (0 .. 2).collect { | o | o * 12 + c }.flat, inf)
).midicps;
Splay.ar(
	SinOsc.ar(
		BrownNoise.ar() * 0.0125 + 1 * f,
		(BrownNoise.ar() * 0.4 * (SinOsc.ar([3.25, 1 / 2, 2] * f, 0) * e.value(-58))).sum
	) * e.value(-6) * (SinOsc.ar(d + 2, 0) / 4 + 0.5),
	1/4
)

// https://sonomu.club/@lukiss/111455666847951601
var t = {
	TDuty.kr(Dseq([3, 4, 2, 1, 2, 4] / 8, inf), 0, 1, 0, 0)
};
var r = { | l h |
	TExpRand.kr(l, h, t.value).lag3(1 / 48, 1 / 16)
};
var e = Env.perc(r.value(1 / 128, 2 / 8), 1 / 6, 1, -4).kr(0, t.value);
var o = (Blip.ar(r.value(11, 111), r.value(1 / 3, 333)) * e).tanh;
3.do {
	o = LeakDC.ar(
		CombC.ar(
			o,
			3 / 4,
			r.value(1 / 512, 3 / 4) * (LFDNoise1.kr(6 ! 2) * 0.001 + 1),
			r.value(1 / 2, 1 / 64) * TChoose.kr(t.value, [-1, 1])
		).tanh,
		0.995
	).sanitize
};
o.softclip

// https://sonomu.club/@lukiss/110533029814503247
var p = (1, 2 .. 14).degreeToKey([0, 2, 4, 7, 9], 12).midiratio;
var f = SinOsc.ar(p.sin * 8, 0) * 0.005 + 1 * p * 52;
var h = SinOsc.ar(f * 2, 0) * SinOsc.ar(1 / 4 / p, 0) * SinOsc.ar(pi / p, 0).linexp(-1, 1, 0.01, 1) * 8 * pi;
var m = LFSaw.ar(-1 * [7, 3.5, 7 / 10] * (SinOsc.ar(f.sin.linexp(-1, 1, 0.01, 1), 0) * 0.001 + 1), 1) * 0.5 + 0.5;
var e = m ** (SinOsc.ar(8 / p / f.atan, 0) * 30 + 32);
var o = SinOsc.ar(f, h) * e;
Splay.ar(0.5 * o, SinOsc.ar(pi, 0))

// https://sonomu.club/@lukiss/110538742878262809
var c = (12 .. 38).scramble.degreeToKey([0, 2, 4, 7, 9], 12);
var w = LFSaw.ar(8, 0) * 0.012 + 1;
var t = [6, 3 / 2, 3, 3 / 4, 1 / 4];
var d = Demand.ar(
	TDuty.ar(1 / t, 0, 1, 0, 0),
	0,
	Dseq((0 .. 23).collect { | n | Dseq(c[0, n + 1 .. c.size - 1], 1) }, inf)
).lag3(0.001);
var e = LFSaw.ar(-1 * t, 1) * 1 + 1 / 2;
var o = (LFSaw.ar(w * d.midicps, 0) * e).fold2(1) * (LFSaw.ar(d % t.log, 0) > 0);
var f = e.lag3(0.005) ** (LFSaw.ar(pi / t, 1) * 8 + 9) * (LFSaw.ar(0.1 / t, 1) + 1 * 5E3 + 200);
Splay.ar(
	CombC.ar(MoogFF.ar(o, f, 2, 0), 0.2, 0.2, 1) * 0.8,
	LFSaw.ar(pi, 0)
)

// https://sonomu.club/@lukiss/111518889311136686 ; Dec 04, 2023
var t = TDuty.kr(1 / (2 ** Diwhite(0, 6, inf)), 0, 1, 0, 0);
var r = { | lo hi |
	TRand.kr(lo, hi, t)
};
var l = {
	var z = nil;
	TChoose.kr(
		t,
		(0 .. 3).collect { | n |
			z = (LFNoise2.kr(4) * 2 + 3 ** n) / 4;
			SinOsc.ar(z, 0).sin
		}
	).lag(1 / 8 / z)
};
var e = LFSaw.kr(l.value * r.value(1, 8), 1) + 1 / 2;
var f = r.value(24,48).ceil.midicps;
var p = (1 .. 32);
var q = SinOsc.ar(
	f * p * p.midiratio,
	SinOsc.ar(p.midiratio ** 2, 0) * (l.value * 2 - e * 2 * pi)
) * ((e * p.midiratio).log.sin.abs ** r.value(4, 128));
var a = Splay.ar(q.scramble, SinOsc.ar(r.value(0.5,8), 0));
var h = SinOsc.ar(
	SinOsc.ar([6, 7], 0) * (1 / 6) + 2 * f,
	0
) * (1 - e ** 8) * r.value(1, 32);
var b = SinOsc.ar(f, h) * (1.1 - e ** 2) * 0.5;
(a + b).sanitize

// https://sonomu.club/@lukiss/111749211970689312 ; Jan 14, 2024
var p = (1, 5 .. 96);
var c = { | a b c |
	StandardL.ar(a / pi, 1, 0.5, 0).sin.linlin(-1, 1, b, c)
};
var t = 2 ** (c.value(5, 0, 4)).floor;
var d = Latch.ar((c.value(13, 1, 5)).floor / t, TDuty.ar(1 / t, 0, 1, 0, 0));
var l = {
	TChoose.kr(
		TDuty.kr(c.value(pi, 1 / t, 5) * d, 0, 1, 0, 0),
		[
			p * p.degrad,
			p.difsqr(p.scramble),
			p * p.log2,
			p.midiratio
		]
	)
};
var e = Env.perc(d / t, d, 1, 0).ar(0, TDuty.ar(d, 0, 1, 0, 0));
var a = (e.lincurve(0, 1, 1, 0, c.value(3, 2, -8)) * p).log.sin ** c.value(13, 4, 36);
var b = (e > c.value(9, 0.003, 0.9)).lag3(0.003);
LPF.ar(
	Splay.ar(
		SinOsc.ar(
			d * 55 * l.value,
			SinOsc.ar(l.value, 0) * e * c.value(2pi, 0, 2pi)
		) * a * b,
		SinOsc.ar(2pi, 0) * e
	).sanitize,
	9E3
)

// https://sonomu.club/@lukiss/112090171577198222 ; Mar 14, 2024
var m = {
	QuadL.ar(LFDNoise1.ar(1) + 1 ** 2, 1, -1, -0.75, 0)
};
var i = BPF.ar(LocalIn.ar(2, 0), 440, 1);
var u = Splay.ar(
	VarSaw.ar(
		m ! 12 / 4 + 111 * (0 .. 2).collect { | n |
			n * 12 + [0, 2, 5, 9]
		}.flat.midiratio,
		0,
		m.value.sin + 1 / 2 ** 2
	) * LFSaw.ar(-2 * m.value ** 2 * 2, 0).max(0),
	m.value
);
var d = DelayC.ar(i, 1, 1 / 3);
var o = (d * (m.value + 1 / 2) + u).tanh;
o * -6.dbamp <! LocalOut.ar(o)

// https://sonomu.club/@lukiss/113012278480517510 ; Aug 24, 2024, 02:28
var p = (1, 3 .. 64);
var r = 2 ** (Logistic.ar(3.9, 3, 0.5) + 1 * 2.1).floor;
var e = Linen.kr(TDuty.kr(1 / r, 0, 1, 0, 0), 0, 1, 0.9 / r, 0);
Splay.ar(
	Blip.ar(
		73 * p * p.degrad,
		Blip.ar(r / p, 0) + 1 / 2 ** 2 * 33
	).sin * ((1 - e * p).log.sin.sin ** (Blip.ar(0.1 / r, 0) + 2 * 2)).sanitize * (e > 0.1),
	Blip.ar(r, 0.1)
)

// https://sonomu.club/@lukiss/113019188464159465 ; Aug 25, 2024, 07:45
var k = 2 ** StandardN.ar([1.1, 0.9], 1, 0.5, 0) * 8;
Splay.ar(
	LeakDC.ar(StandardN.ar(StandardN.ar(k, 1, 0.5, 0).max(0) * 22050, k.sin, 0.5, 0) / 4, 0.995),
	StandardN.ar(k.sum, 1, 0.5, 0)
)

// https://sonomu.club/@lukiss/113199362402063463 ; Sep 26, 2024, 03:26
var t = {
	CuspL.ar(LFDNoise1.ar(1 ! 2).max(0) ** 2 * 32, 1, 1.9, 0)
};
var r = { |x y|
	TRand.kr(x, y, t.value)
};
Sanitize.ar(
	Splay.ar(
		CompanderD.ar(
			LeakDC.ar(
				LorenzL.ar(
					t.value * SampleRate.ir(),
					r.value(1, r.value(1, 11)),
					r.value(1, r.value(2, 30)),
					r.value(0.001 / 77, 1 / 17),
					0.05,
					0.1, 0, 0
				).softclip,
				0.995
			),
			1 / 2,
			1 / 2,
			1 / 2,
			0.005,
			0.1
		),
		t.value()[0]
	),
	0
)

// https://sonomu.club/@lukiss/113293650390466946 ; Oct 12, 2024, 08:05 PM
var p = (1, 5 .. 96);
var c = { |a b c|
	StandardL.ar(a / pi, 1, 0.5, 0).sin.range(b, c)
};
var t = 2 ** (c.value(5, 0, 4)).floor;
var d = Latch.ar(
	c.value(13, 1, 5).floor / t,
	TDuty.ar(1 / t, 0, 1, 0, 0)
);
var l = {
	TChoose.kr(
		TDuty.kr(c.value(pi, 1 / t, 5) * d, 0, 1, 0, 0),
		[
			p * p.degrad,
			p.difsqr(p.scramble),
			p * p.log2,
			p.midiratio
		]
	)
};
var e = Env.perc(d / t, d, 1 , 0).ar(0, TDuty.ar(d, 0, 1, 0, 0));
var m = (e.lincurve(0, 1, 1, 0, c.value(3, 2, -8)) * p).log.sin ** c.value(13, 4, 36);
LPF.ar(
	Splay.ar(
		SinOsc.ar(
			d * 55 * l,
			SinOsc.ar(l, 0) * e * c.value(2 * pi, 0 , 2 * pi),
		) * m * Lag3.ar(e > c.value(9, 0.003, 0.9), 0.003),
		SinOsc.ar(2 * pi) * e
	).sanitize,
	9E3
)

// https://sonomu.club/@lukiss/113301936019342699 ; Oct 14, 2024, 07:12 AM
var d = 4 ** (0 .. 4);
var o = VarSaw.ar(
	d * 55,
	1,
	CuspN.ar(d.atan / 8, 1, 1.9, 0) + 1 / 2
);
Splay.ar(
	Compander.ar(
		DelayC.ar(
			o * Env.perc(
				0,
				1 / (VarSaw.ar(1 / d, 0, 0.5) + 1 * d + d),
				1,
				-4
			).ar(
				0,
				CuspN.ar(8, 1, 1.9, 1 / d),
				1,
				1,
				0
			) + (CuspN.ar(22050, 1, 1.9, 0) * 2E-4),
			1,
			0.005
		),
		o.rotate(1),
		1 / 2,
		1 / 2,
		1 / 4,
		0.004,
		1 / 6
	).sin / 2,
	CuspN.ar(8, 1, 1.9, 0)
)

// https://sonomu.club/@lukiss/113333974470037868 ; Oct 19, 2024, 11:00 PM
var f = 110;
var o = SinOsc.ar(f, 0);
5.do {
	o = SinOsc.ar(
		f * o.degrad,
		SinOsc.ar(1 + o.ceil * f, 0) * pi
	)
};
o ! 2 / 4
