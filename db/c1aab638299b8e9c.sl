let sndBuf = SfAcquireMono('floating_1');
let envBuf = -1;
let freq = MouseY(10, 100, 1, 0.2);
let pan = MouseX(-1, 1, 0, 0.2);
GrainBuf(
	2,
	Impulse(freq, 0),
	0.1,
	sndBuf,
	LfNoise1(500).LinLin(-1, 1, 0.5, 2),
	LfNoise2(0.1).LinLin(-1, 1, 0, 1),
	2,
	pan,
	envBuf,
	512
)
