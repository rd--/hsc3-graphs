(* Spa Saw Shower Wash ; https://github.com/lukiss/Losers-Union-SC-Research *)
let c = 4096.sineTable(1 / (1 .. 128), [0]).normalize.asWavetable.asLocalBuf;
let w = { :freq |
	LfdNoise3(freq).LinLin(-1, 1, 80, 6880) (* LinCurve *)
};
let f = SinOsc(
	{ Rand(3.3, 4.4) } ! 6,
	0
) * 0.01 + 1 * [82 123 196 147 41 55];
let o = Splay(
	Osc(
		c,
		f,
		Osc(
			c,
			f * 3,
			0
		) * SinOsc(1 / Rand(33, 45), 0) * pi
	) / 5,
	SinOsc(1 / pi, 0)
);
o := BHiPass4(o, w(1 / 7), 1) + Bpf(o, w(1 / 5), 1) + MoogFf(o, w(1 / 3), 2, 0);
4.timesRepeat {
	o := AllpassC(o, 1, { Rand(1 / 16, 1 / 32) } ! 2, 1)
};
o
