(* Stretching again ; https://github.com/lukiss/Losers-Union-SC-Research *)
var c = 16;
var f = 41;
var t = (0 .. c).collect { :n |
	PulseDivider(Impulse(f, 0), c, 15 - n)
};
Splay(
	PlayBuf(
		1,
		SfAcquireMono('floating_1'),
		LfNoise2(1 ! c) * 0.1 / c + 1,
		t,
		Sweep(0, MouseX(0.001, 1 / 5, 1, 0.2)) % 1 * 180000,
		0,
		0
	) * Sine(t, c / f),
	7 / 8
) / 2
