// SCSCC-14 "Quad Melody" 252 bytes
var z = { |x|
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

// SCSCC-26
var c = midiratio(12 * (0 .. 2) +.x (5 * (0 .. 3) ++ [19]));
var m = { LFDNoise3.ar(0.1 ! 5) + 1 / 2 };
Splay.ar(
	{ |n|
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
