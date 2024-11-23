let i = Hpf(PinkNoise(), [1111, 333, 55]) * 0.1;
let p = PanAz(
	[8, 4, 4],
	i,
	LfSaw(MouseX(1 / 5, 5, 1, 0.2), 0),
	1,
	1,
	[0, 0.5, 0.5]
);
let g = PanAz(
	3,
	Dc(1),
	MouseY(-2 / 3, 2 / 3, 0, 0.2),
	1,
	MouseX(1, 3, 0, 0.2),
	0
);
(p * g).Mix * 4
