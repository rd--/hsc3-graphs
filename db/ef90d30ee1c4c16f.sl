let [w, x, y, z] = PanB(
	PinkNoise() * 0.1,
	LfSaw(0.5, pi),
	0,
	0.3
);
Silent(8) ++ DecodeB2(8, w, x, y, 0)
