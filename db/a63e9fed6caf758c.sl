(* FbSineC ; randomly modulate params *)
FbSineC(
	LfNoise2([1, 2]) * 1000 + 10000,
	LfNoise2([1, 2]) * 32 + 33,
	LfNoise2([1, 2]) * 0.5,
	LfNoise2([1, 2]) * 0.05 + 1.05,
	LfNoise2([1, 2]) * 0.3 + 0.3,
	0.1,
	0.1
) * 0.05
