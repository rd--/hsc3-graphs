let grainSize = 0.5;
PitchShift(
	in: AudioIn([1, 2]),
	windowSize: grainSize,
	pitchRatio: 1,
	pitchDispersion: MouseX(0, 1, 0, 0.2),
	timeDispersion: MouseY(0, grainSize, 0, 0.2)
)
