(* filtered decorrelated noise ; jmcc *)
CombN(
	Resonz({ BrownNoise() } ! 2 * 0.4, MouseX(20, 12000, 1, 0.2), 0.2),
	1 / 80,
	1 / 80,
	0.3
)
