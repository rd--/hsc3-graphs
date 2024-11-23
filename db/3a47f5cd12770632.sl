/* LatoocarfianC ; randomly modulate all params */
LatoocarfianC(
	SampleRate() / 4,
	LfNoise2(2) * 1.5 + 1.5,
	LfNoise2(2) * 1.5 + 1.5,
	LfNoise2(2) * 0.5 + 1.5,
	LfNoise2(2) * 0.5 + 1.5,
	0.5,
	0.5
) * 0.1
