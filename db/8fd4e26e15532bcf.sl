;; 20060920 (rd)
var f = Formlet(
	Blip(10, 12),
	LfNoise0([20, 40]) * 43 + 700,
	0.005,
	MouseX(0.012, 0.19, 1, 0.1)
) + SinOsc(40, 0) * LfNoise0([5, 10]);
f * Ln(0, 0.25, 2.5)
