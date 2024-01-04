var a = [
	SinOsc(0.25, 0),
	LfSaw(10, 0),
	LfPulse(0.3, 0, 0.5)
].kr;
SinOsc(SelectX(MouseX(0, 1, 0, 0.2) * a.size, a) * 300 + 400, 0) * 0.2
