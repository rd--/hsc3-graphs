(* Drone 22 Maj 2021 ; https://github.com/lukiss/Losers-Union-SC-Research *)
var n = 4;
var l = { :mul |
	(LfdNoise3(0.05 ! n) * mul).Abs
};
var d = {
	{
		Demand(
			Impulse(1 / (30 .. 53).atRandom, 0),
			0,
			Dxrand(inf, (7 .. 53).degreeToKey([0 1 4 5 7 9 10], 12).MidiCps)
		)
	} ! n
};
Splay(
	Hpf(
		CombC(
			PmOsc(
				d(),
				d(),
				l(2),
				l(0.5)
			) * (l(0.25) + 1 / 4),
			1 / 4,
			1 / 4 - l(1 / 16),
			7
		),
		110
	) * -12.DbAmp
)
