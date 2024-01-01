var a = [
	Saw(LfSaw(3 * [1, 1.01], 0) * 100 + 230),
	SinOsc(440, 0),
	Pulse(LfPulse(3 * [1, 1.02], 0, 0.5) * 100 + 230, 0.5),
	SinOsc(SinOsc(4 * [1, 1.03], 0) * 200 + 300, 0)
];
SelectXFocus(
	MouseX(0, 1, 0, 0.2) * a.size,
	a,
	MouseY(0, a.size, 0, 0.2),
	false
).Sum * 0.2
