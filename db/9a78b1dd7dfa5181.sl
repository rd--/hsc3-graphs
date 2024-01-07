let [w, x, y] = PanB2(
	PinkNoise(),
	LfSaw(MouseX(1 / 5, 5, 1, 0.2), 0),
	0.1
);
Silent(8) ++ DecodeB2(8, w, x, y, 0)
