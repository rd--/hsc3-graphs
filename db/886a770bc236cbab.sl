let k = 8;
let i = SinOsc({ Rand(333, 555) } ! k, 0) * 0.1;
let g = PanAz(
	k,
	Dc(1),
	LfSaw(MouseX(1 / 5, 5, 1, 0.2), 0),
	1,
	MouseY(1, 3, 0, 0.2),
	0
);
i * g
