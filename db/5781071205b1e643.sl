{- GrainBuf ; requires=keywords -}
let sndBuf = SfAcquireMono('floating_1');
let envBuf = -1;
let pan = MouseX(-1, 1, 0, 0.2);
GrainBuf(
	numChan: 2,
	trigger: Impulse(10, 0),
	dur: 0.1,
	sndBuf: sndBuf,
	rate: LfNoise1(500).LinLin(-1, 1, 0.5, 2),
	pos: LfNoise2(0.1).LinLin(-1, 1, 0, 1),
	interp: 2,
	pan: pan,
	envBufNum: envBuf,
	maxGrains: 512
)
