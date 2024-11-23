/* Police state (Jmcc) #2 */
let e = LfNoise2(LfNoise2([0.4, 0.4]) * 90 + 620) * (LfNoise2([0.3, 0.3]) * 0.15 + 0.18);
CombL(
	{
		let f = SinOsc(Rand(0.02, 0.12), Rand(0, 2.pi)) * Rand(600, 1600) + Rand(-300, 300);
		Pan2(SinOsc(f, 0) * LfNoise2(100 + Rand(-20, 20)) * 0.1, Rand(-1, 1), 1)
	} !> 4 + e,
	0.3,
	0.3,
	3
) * 0.5
