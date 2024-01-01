var numChannels = 8;
var trigger = Impulse(10, 0);
var dur = 0.1;
GrainFm(
	numChannels,
	trigger,
	0.1, (* dur *)
	WhiteNoise() * MouseY(0, 400, 0, 0.2) + 440, (* carFreq *)
	TRand(20, 200, trigger), (* modFreq *)
	LfNoise1(500).Range(1, 10), (* index *)
	MouseX(-1, 1, 0, 0.2), (* pan *)
	-1, (* envBufNum *)
	512 (* maxGrains *)
).Splay * 0.1
