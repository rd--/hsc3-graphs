var sndBuf = SfAcquireMono('floating_1');
var envBuf = -1;
var freq = MouseY(10, 100, 1, 0.2);
var pan = MouseX(-1, 1, 0, 0.2);
GrainBuf(
	2,
	Impulse(freq, 0),
	0.1,
	sndBuf,
	LfNoise1(500).Range(0.5, 2),
	LfNoise2(0.1).Range(0, 1),
	2,
	pan,
	envBuf,
	512
)
