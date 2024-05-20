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
	var z;
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
