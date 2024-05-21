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
