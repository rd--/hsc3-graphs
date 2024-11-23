/* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/121220soft */
Bpf(
	WhiteNoise(0.2 # 2, 0),
	LfNoise2(0.4).ExpRange(880, 920),
	0.001
) * 7
