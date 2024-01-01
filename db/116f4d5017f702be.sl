var sf = SfAcquire('floating_1', 1, [1]);
FreqShift(
	PlayBuf(1, sf, 1, 0, 0, 1, 0),
	LfNoise0(0.45) * 1000,
	0
) * 0.5
