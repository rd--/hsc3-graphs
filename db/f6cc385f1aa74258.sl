{- Fm7 ; two of six -}
let ctlMatrix = [
	XLine(300, 310, 4), 0, 1,
	XLine(300, 310, 8), 0, 1,
	0, 0, 1,
	0, 0, 1,
	0, 0, 1,
	0, 0, 1
];
let modMatrix = [
	Line(0, 0.001, 2), Line(0.1, 0, 4), 0, 0, 0, 0,
	Line(0, 6, 1), 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0
];
Fm7(ctlMatrix, modMatrix).first(2) * 0.1
