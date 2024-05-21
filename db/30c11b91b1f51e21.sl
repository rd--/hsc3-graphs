let mod = LfNoise2(80);
SinOsc(
        LinLin(
		mod,
		SinOsc(0.2, 0),
		SinOsc(0.2543, 0),
		MouseX(200, 8000, 1, 0.2),
		MouseY(200, 8000, 1, 0.2)
        ),
	0
) * 0.1
