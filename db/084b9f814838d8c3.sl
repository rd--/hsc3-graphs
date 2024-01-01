var numChannels = 8;
var numVoices = 16;
var inArray = (1 .. numVoices).collect { :each |
	SinOsc(LfNoise2(Rand(10, 20)) * 200 + (each * 100 + 400), 0)
};
var spread = MouseY(1, 0, 0, 0.2);
var level = 0.2;
var width = 2;
var center = MouseX(-1, 1, 0, 0.2);
var orientation = 0.5;
var levelComp = true;
SplayAz(
	numChannels,
	inArray,
	spread,
	level,
	width,
	center,
	orientation,
	levelComp
)
