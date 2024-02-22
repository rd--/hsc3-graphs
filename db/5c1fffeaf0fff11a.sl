let numChannels = 8;
let numVoices = 16;
let inList = 1:numVoices.collect { :each |
	SinOsc(LfNoise2(Rand(10, 20)) * 200 + (each * 100 + 400), 0)
};
let spread = MouseY(1, 0, 0, 0.2);
let level = 0.2;
let width = 2;
let center = MouseX(-1, 1, 0, 0.2);
let orientation = 0.5;
let levelComp = true;
SplayAz(
	numChannels,
	inList,
	spread,
	level,
	width,
	center,
	orientation,
	levelComp
)
