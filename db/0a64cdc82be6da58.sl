let numChannels = 8;
let envDur = 15;
let trigger = Impulse(Line(7.5, 15, envDur), 0);
let dur = 0.1;
let carFreq = Line(200, 800, envDur);
let modFreq = 200;
let index = Line(-1, 1, envDur);
let pan = Line(-0.85, 0.85, envDur);
let envBufNum = -1;
let maxGrains = 512;
GrainFm(
	numChannels,
	trigger, dur,
	carFreq, modFreq, index,
	pan,
	envBufNum,
	maxGrains
).Splay * 0.1
