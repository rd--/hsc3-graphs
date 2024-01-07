let k = [1, 2];
Pan2(
	SinOsc(PenX(k) * 555 + 333, 0),
	PenY(k) * 2 - 1,
	PenZ(k) * PenDown(k)
).Sum
