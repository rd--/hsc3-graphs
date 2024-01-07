(* Dust ; as envelope ; applicative form *)
let lfo = { :freq :lo :hi |
	Range(LfNoise2(freq), lo, hi)
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
