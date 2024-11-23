/* Grains, Daily ; https://github.com/lukiss/Losers-Union-SC-Research */
let m = { :lo :hi |
	StandardL(LfdNoise1(1).ExpRange(0.01, 1) * 8 + 0.1, 2, 0.5, 0).ExpRange(lo, hi)
};
let f = {
	StandardL(m(1, 128), m(1, 3), 0.5, 0).ExpRange(40, 5000)
};
let n = 8;
LeakDc(
	GrainFm(
		n,
		Impulse(f() / m(0.5, 8), 0),
		m(0.1, 4) / f(),
		f(),
		m(1 / 4, 4) * f(),
		m(1 / 4, 4),
		StandardL(f() / 2, 1, 0.5, 0) / 2,
		-1,
		1024
	).Splay,
	0.995
).SoftClip / 2
