let p = PinkNoise();
let [w, x, y, z] = BfEncode1(
	p,
	MouseX(0 - pi, pi, 0, 0.2),
	MouseY(0.25 * pi, -0.25 * pi, 0, 0.2),
	1,
	1,
	0
);
BfDecode1(
	w, x, y, z,
	[-0.25 0.25 1.25 0.75 -0.25 0.25 1.25 0.75] * pi,
	[0.25 0.25 0.25 0.25 -0.25 -0.25 -0.25 -0.25] * pi,
	0
)
