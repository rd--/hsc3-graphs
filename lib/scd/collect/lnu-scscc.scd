// SCSCC-5 "Printer Gone Mad" 138 bytes
var r = 9000;
var t = Sweep.ar(0, r) % r;
var d = { TRand.ar(0, 256, t < 1) };
var o = d.value;
{
	o = (
		o
		| ((t / d.value / 4)
			& d.value
			| ((t / d.value) % o & d.value)
			| (( o > d.value * (t * 2 & d.value | d.value))
				& (t * d.value & (t / d.value))))
	)
} ! 5;
LeakDC.ar(o, 0.995).fold2 / 9 ! 2

// SCSCC-12 "Emergency Sauce" 223 bytes
var z = { | x | LFSaw.ar(x, 0) };
var m = { 1 << (LFNoise2.kr(2) + 1 * 2.2) };
var x = 36;
var f = 3 * (0 .. x - 1) + 16;
var a = sin(z.value(m.value / 32) + 2 * 2pi * z.value(midicps(f)));
var b = sin(log2(z.value(m.value) + 1 / 2 * (1.1 + z.value(m.value / x) * f)).sin ** 8);
var c = z.value({ -1 * m.value } ! x / (m.value * x)).max(0);
FreeVerb.ar(
	Splay.ar(
		LPZ2.ar(a * b * c),
		z.value(m.value / 4)
	),
	m.value.sin + 1 / 3,
	m.value / x,
	x / m.value
)

// SCSCC-13 "Waiting for Something Good to Happen" 204 bytes
var a = [0, 8, 10, 15, 18];
var p = 1 << (0 .. 4);
var f = 82 * if(
	LFSaw.ar(1 / 5, 0) > 0,
	a,
	3 ! 4 ++ [4] + a
).midiratio;
Splay.ar(
	{ | n |
		var q = f[n] * p;
		(
			SinOsc.ar(
				q,
				SinOsc.ar(p / 5 + 3, 0) * SinOsc.ar(7 / q[0], 0)
			) *	neg(SinOsc.ar(rotate(p, n) / q, 0) + 3 ** 2 * p).dbamp
		).sum / 4
	} ! 5,
	SinOsc.ar(1 / 3, 0)
)

// SCSCC-14 "Quad Melody" 252 bytes
var z = { | x |
	LFSaw.ar(x, 0)
};
var l = QuadN.ar(
	[2, 1],
	-0.001 * (0 .. 7) + 1,
	-1, -0.75, 0
).sin;
var a = QuadN.ar(41, 1, -1, -0.75, 0);
var b = round(l * 5 + (5 + (0 .. 7) + 16), 5).midicps;
var c = sin(pi * z.value(a / 4 + b * midiratio(7 * (0 .. 9))));
var d = z.value(-2 ** round(l * 3 / 2) / (1 .. 3));
var o = Splay.ar(
	c * lag(
		d + 1 / 2 ** abs(z.value(1 + l) ** 0.1 * 9) / 2,
		0.003
	),
	l[0]
);
CombC.ar(
	o,
	1,
	l.lag[3, 7] / 9 + [3, 2] / 8,
	l[6 .. 7] * 4
) * (1 / 8) + o

// SCSCC-22 "Siv" 238
var h = 1 / 2;
var e = 1 / 4 > LFSaw.ar(h, 0);
BRF.ar(
	Splay.ar(
		LFSaw.ar(
			e / 2 + 1 * [82, 146, 195, 246] * (LFSaw.ar(0.1 + (0 .. 3) * 3, 0).abs / 24 + 1),
			0
		),
		LFSaw.ar(h, 0)
	),
	LFSaw.ar(h / (9 / 7 + LFSaw.ar(h / 34, 0) ** 2 * 4), 0).abs * 4000 + 82,
	4
) * (
	LFSaw.ar(-8, 1) + 1 / 2 ** (LFSaw.ar(h / 27, 0).abs * 8 + h) / 2
	+
	(slew(e, 1000, 1) ** (LFSaw.ar(h / 46, 0).abs * 3 + h))
) / 5 * Line.kr(0, 1, 9)

// SCSCC-24 "Loading…" 221 bytes ; https://github.com/lukiss/SCSCC/
var r = (12 * (0 .. 4) +.x [0, 10, 15, 19]).midiratio;
Splay.ar(
	{ | n |
		var a = LFSaw.ar(1 / (2 ** n % 111), 0);
		var b = LFSaw.ar(-1 << (0 .. 2) / (1 + n), 0);
		var c = PMOsc.ar(
			1 << (0 .. 2) * 0.1,
			0.1 ** n / (0 .. 2) + 0.1,
			10 - n ** (0 .. 2) + 3,
			0
		) + 2 * 4;
		var d = Lag.ar(
			b + 1 / 2 ** c * 6 / (3 << (0 .. 2)),
			0.002
		);
		var e = (1 / 2 < a * 1 / 2 + 1) * 98;
		PMOsc.ar(
			e * r[n],
			e * r[n + 1],
			d[0],
			d[1]
		) * d[2]
	} ! 10,
	PMOsc.ar(3, pi, 0, 0)
)

// SCSCC-25 "Feeling Melancholy at the Spa, In A minor"
var r = midiratio(12 * (0 .. 4) +.x (5 * (0 .. 4) ++ [19]));
var z = { | x | LFSaw.ar(x, 0) };
var h = 1 / 2;
var w = CuspL.ar(h, 1, 1.9, 0) + 1 / 2 ** h * 4;
var t = LFSaw.kr(2 ** w / 8, (0 .. 7) / 4 - 1);
GVerb.ar(
	HPF.ar(
		{ | n |
			var a = TChoose.kr(
				t[n] ! 4,
				110 * r
			);
			Pluck.ar(
				CuspL.ar(22050, 1, 1.9, 0) / 4,
				t[n],
				h,
				z.value(n % w) / 77 + 1 / a,
				z.value(w + n % h) + 2.1 * 4,
				1 - z.value(w % h).abs ** 2 * h + h
			).sum
		} ! 8,
		50
	).sum / 4,
	10, 3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300
)

// SCSCC-26
var c = midiratio(12 * (0 .. 2) +.x (5 * (0 .. 3) ++ [19]));
var m = { LFDNoise3.ar(0.1 ! 5) + 1 / 2 };
Splay.ar(
	{ | n |
		var q = LFPulse.ar(
			(4..8).nthPrime * m.value,
			0,
			m.value / (m.value * 2)
		) * 2 + 1;
		var f = q * 49;
		LeakDC.ar(
			(
				Formant.ar(
					c.wrapAt(n - (6 * (0 .. 4) + 3)) * f,
					c.wrapAt(7 + n * (0 .. 4)) + m.value * f * (1 + m.value * q),
					c.wrapAt(4 + n * (0 .. 4)) + m.value * f / (2 + m.value * q)
				) * (m.value ** 4)
			).sum,
			0.995
		) / 12
	} ! 11
)

// SCSCC-28 256b Dub
var f = 53;
var h = 1 / 3;
var r = midiratio(12 * (0 .. 3) +.x (5 * (0 .. 4) ++ [19]));
var l = nil;
var a = nil;
var o = Splay.ar(
	{ | n |
		var p = n.nthPrime;
		var x = 1 / 2 < (l = LFSaw.ar(1 / (2 ** n % f), 0).abs) * 1 / 2 + 1 * 66 * r;
		var y = x.wrapAt([n, p]);
		var z = lag(
			LFSaw.ar(
				-2 << (0 .. 2) / (2 ** (p % 15) % f) * h,
				0
			) + 1 / 2 ** (5 * (a = 4 + l)) * (3 - a ** n % a * 2),
			0.002
		);
		PMOsc.ar(y[0], y[1], z[0], z[1]) * z[2] / 7
	} ! 13,
	h
);
CombC.ar(
	o,
	h,
	PMOsc.ar(h, [7, 9], l, 0) * 0.007 + 1 / 4,
	a
) / 9 + o

// SCSCC #29 Dystopian B-Movie Sauce 199b
var m = { LFNoise2.ar(0.003) + 1 / 2 };
var b = { | x |
	VarSaw.ar(
		x,
		0,
		VarSaw.ar(m ! 2 / 33, 0, 0.5) + 1 / 2
	)
};
var f = m.value / 2 + 69;
var o = b.value(f);
{
	o = LeakDC.ar(
		b.value(
			f = LFNoise2.kr(33 ! 2) / 222 + 1 * f * 1.189
		).fold(
			b.value(2 / 3 * f),
			b.value(3 / 2 * f)
		).blend(
			o,
			b.value(m.value ** pi / 9).abs
		),
		0.995
	)
} ! 9;
o / 5 * Line.kr(0, 1, 14)

// SCSCC #32 Baum 219
var f = Index.ar(
	(12 * (0 .. 5) +.x (5 * (0 .. 3) ++ [19])).as(LocalBuf),
	round(
		QuadC.ar(1, 1, -1, -0.75, 0) + 1 / 2 * 30,
		ceil(QuadC.ar(0.9, 1, -1, -0.75, 0) + 1 * 12)
	)
);
var z = Formlet.ar(
	HPZ1.ar(f).abs * QuadC.ar(22050, 1, -1, -0.75, 0),
	55 * f.midiratio,
	0.002,
	1
).sin;
var o = PitchShift.ar(
	z,
	1,
	(8 + f).log,
	0.1,
	0.1
) + z;
Pan2.ar(
	CombC.ar(o, 0.2, 0.2, 1) / 6 + o / 4,
	0,
	1
)

// SCSCC #33 "Nudge"
var m = { LFDNoise3.ar(1 / 3) + 1 / 2 };
var b = { | x | Blip.ar(x, m ** pi * 16) };
var r = midiratio(
	(2 * (0 .. 1) +.x (5 * (0 .. 3) ++ [19])) +.x (24 * (0 .. 2))
);
var c = m ! 2 / 33 + 1 * 29 * r.iter;
Splay.ar(
	{
		var p = b.value(m / 9 + 4).fold(m / 9, 1);
		var q = b.value(c.next).fold(b.value(c.next),b.value(c.next));
		LeakDC.ar(
			BPF.ar(
				p ** 5 * q,
				b.value(m * 8) + 1.1 * 2000 + 100,
				1 / 3 + m
			) / 2,
			0.995
		)
	} ! 10,
	b.(m)
) / 2

// SCSCC-38 "Index" ; https://github.com/lukiss/SCSCC/
var t = LFSaw.ar(-7, 0);
var c = Index.ar(
	((7 * (0 .. 3)) +.x (5 * (0 .. 3))).as(LocalBuf),
	Stepper.ar(
		t,
		0,
		LFSaw.ar((0 .. 2) + 0.1 / 3, 0).abs * 16,
		LFSaw.ar((0 .. 2) + 0.1 / pi, 0).abs * 16,
		1,
		0
	)
).midiratio;
Splay.ar(
	LeakDC.ar(
		CombC.ar(
			LFSaw.ar(1 << (0 .. 2) / 4 * 98 * c, 0) * t.max(0) / 2,
			0.2,
			0.2,
			1
		),
		0.995
	),
	sin(c.sum)
)

// SCSCC-40 "Bonus Level" ; https://github.com/lukiss/SCSCC/
var a = { LFNoise0.kr(1 / 2) };
var k = { a.value + 1 * 4 };
var x = 12 * (0 .. 3);
var d = x +.x [0, 4, 7, 11];
var m = x +.x [0, 3, 7, 10];
var r = Select.kr(
	LFSaw.kr( { a.value.round(1 / 4) } ! 4, 0) + 1 * 8,
	(
		Select.kr(k.value, [0, 2, 4, 5, 7, 9, 11, 12])
		+
		Select.kr(k.value, [d, m, m, d, d, m, m, d])
	)
).midiratio;
var e = abs(LFSaw.kr(1 + a ! 4, 0) * 8 + 1);
Splay.ar(
	LFSaw.ar(
		a ! 4 / 4 + 65 * r,
		0
	) ** e / 5
)

// SCSCC-41 "fifs"
var t = LFSaw.ar(
	-8 / (LFSaw.ar(1 / 2, 1) < 0.5 + 2),
	-1
) + 1 / 2;
var o = Splay.ar(
		t ** 2 * LFSaw.ar(
			131 * midiratio(
				floor(
					LFSaw.ar(1 / 32, 0) * 8
				) * 5 + round(
					3.1 * LFSaw.ar(1 / 8, 1 / 16).max(0), 2
				) + [9, 4, 7, 0] % 12 +.x [19, 0]
			),
			0
		) ** (2.1 - t)
) / 3;
CombC.ar(
	o,
	1 / 4,
	1 / 4,
	1
) / 4 + o

// SCSCC-42 The Universe is 99.9999999999999999999958% Empty
var n = LFNoise2.ar((0 .. 4));
var m = Select.kr(
	Sweep.kr(0, 1) % 4,
	[7, 12, 19, 24]
);
var r = wrap(m + [0, 16, 7, 11, -3], -12, 12).midiratio;
Splay.ar(
	Blip.ar(
		n / 133 + 1 * 198 * r,
		n + 1 * 2 + 1
	) * (n / 2 + 0.5 / 3),
	1 / 2
)

// SCSCC-45 "Lullaby" ; Sub 256 version 194 bytes
var r = 1 << (0 .. 2) * 1.1;
var a = LFSaw.ar(-1 * r, 1).max(0).lag(0.005);
var m = Select.kr(
	A2K.kr(QuadN.ar(r, (0 .. 2) / 9 + 1, -1, -0.75, 0) + 1 * 18),
	(12 * (0 .. 2)) +.x [0, 2, 3, 5, 7, 10] +.x [19, 0]
).midiratio * 49;
Splay.ar(
	Blip.ar(
		Blip.ar(3.1, 33) / 3 + 1 * m,
		a + 3
	) * (a ** 3 + (a ** 0.3) + 0.1)
) / 8

// SCSCC-49 Lydia ; https://github.com/lukiss/SCSCC/
Splay.ar(
	LFSaw.ar(
		Select.kr(
			Gendy3.kr(freq: (1 .. 5) / 99) + 1 * 14,
			(12 * (0 .. 3)) +.x (2 * (0 .. 3) ++ (2 * (0 .. 2) + 7))
		).midiratio * 49,
		0
	) / 5
)

// SCSCC-50 WIP Ba Be Bi Ba
var a = ("R[jln-/457Kcjlm+-144Bckno!/144".ascii - 6).clump(10);
var t = CuspN.ar(CuspN.ar(4, 1, 1.9, 0) + 1.1 * 3, 1, 1.9, 0);
var u = HPZ2.ar(t).abs > 0;
var b = midicps(
	CuspN.ar(2 + t * 99, 1, 1.9, 0) / 99 + 1 * TChoose.ar(
		u,
		a + DC.ar(0)
	).clump(5)
) * lag3(Trig1.ar(u, t + 1.1 / 7), 1 / 77, 1 / 23);
sum(
	Formant.ar(
		midicps(t + 1 * 6 + 42),
		b[0],
		b[1]
	) * (1 / [1, 4, 12, 17, 23])
) / 8 ! 2

// SCSCC-51 #UntzUntz
var f = 98;
var a = SinOsc.ar(2, 0).max(0);
var b = SinOsc.ar(3 / (2 * f), 0) + 1.001 / 11;
var c = SinOsc.ar(2, 4).max(0);
var d = SinOsc.ar(1.9 / f, 0) + 4 * 4;
var e = SinOsc.ar(SinOsc.ar(4 / f, 0) ** pi * f + f * SinOsc.ar(f, 0), 0);
var g = SinOsc.ar(1 / 2, 1.9) ** (SinOsc.ar(0.992 / 7, 0) + 6 * 66);
var h = sum(SinOsc.ar(15.fib[13..14], 0)) * SinOsc.ar(4 / f, 0) / 2;
LeakDC.ar(
	SinOsc.ar(
		log(a ** b * 11).sin ** 5 * 4 * f,
		c ** d * e + (g * h)
	) / 3,
	0.995
) ! 2

// SCSCC-53 Into the abyss
var o = LPZ2.ar(
	Splay.ar(
		LeakDC.ar(
			DelayC.ar(
				LocalIn.ar(2, 0) + 1 * 2,
				1,
				SinOsc.ar(0.009 / (1 .. 8), 0).exprange(0.01, 1)
			),
			0.995
		).sin
	)
);
LocalOut.ar(o);
o / 5
