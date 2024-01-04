(* GrainBuf ; requires=keywords *)
var sndBuf = SfAcquireMono('floating_1');
var envBuf = -1;
var pan = MouseX(-1, 1, 0, 0.2);
GrainBuf(
	numChan: 2,
	trigger: Impulse(10, 0),
	dur: 0.1,
	sndBuf: sndBuf,
	rate: LfNoise1(500).Range(0.5, 2),
	pos: LfNoise2(0.1).Range(0, 1),
	interp: 2,
	pan: pan,
	envBufNum: envBuf,
	maxGrains: 512
)
