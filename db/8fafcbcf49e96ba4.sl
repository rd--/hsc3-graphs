{- https://sonomu.club/@lukiss/110281639162399169 ; Apr 29, 2023 -}
let m = Impulse(8, 0).kr;
let c = { :a |
	let z = [];
	a.collect { :each |
		z.addAll(each.integerDigits(2, 8))
	};
	Demand(m, 0, Dseq(inf, z))
};
let p = m * [
	c([136 138]),
	c([8 9 8 72 8 72 9]),
	c([140 148 34]),
	c([178 58]),
	c([34])
];
let e = { :g |
	Linen(g, 0.01, 1, 1, 0).kr
};
let h = HenonC(1 / [1 .. 5], 1.4, 0.3, 0, 0) < 0.9;
Splay(
	h * [
		LfTri(e(p @ 1) ^ 18 * 133 + 80, 0) * (e(p @ 1) ^ 24),
		HenonC(e(p @ 2) ^ 8 * 800 + 4E3, 1.4, 0.3, 0, 0) * (e(p @ 2) ^ 38),
		LfTri(2E3, 0) * HenonC(1E4, 1.4, 0.3, 0, 0) * (e(p @ 3) ^ 5 ^ 16),
		LfTri(110, 0) * LfTri((ToggleFf(p @ 4) * 7).MidiRatio * 220, 0) * (e(p @ 4) ^ 5 ^ 8),
		0.3 * HenonC(22050, 1.4, 0.3, 0, 0) * (e(p @ 5) ^ 68 + (0.5 * e(p @ 5) ^ 3))
	],
	0.25
)
