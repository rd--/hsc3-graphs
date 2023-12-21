(* LfNoise0 *)
CombN(
	Lpf(LfNoise0(MouseX(300, 2200, 0, 0.2) * [1, 1.1]) * LfPulse(1, 0, 0.3) * 0.1, 800).Abs,
	0.2,
	[0.2, 0.17],
	5
)
