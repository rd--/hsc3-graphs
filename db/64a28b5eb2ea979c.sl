/* Dust ; As envelope ; Applicative form */
let lfo = { :freq :lo :hi |
	LfNoise2(freq).LinLin(-1, 1, lo, hi)
};
AllpassN(
	Bpf(
		PinkNoise() * Decay(
			Dust([3 / 5, 5 / 7]) * 1 / 4,
			lfo(1 / 3, 1 / 5, 5 / 7)
		),
		lfo(1 / 3, 700, 2300),
		lfo(1 / 3, 1 / 9, 3)
	),
	1 / 5,
	1 / 5,
	lfo(1 / 3, 1 / 3, 3)
)
