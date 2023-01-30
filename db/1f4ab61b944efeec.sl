;; Fm7 ; two of six
var ctlMatrix = [
	[XLn(300, 310, 4), 0, 1],
	[XLn(300, 310, 8), 0, 1],
	[0, 0, 1],
	[0, 0, 1],
	[0, 0, 1],
	[0, 0, 1]
];
var modMatrix = [
	[Ln(0, 0.001, 2), Ln(0.1, 0, 4), 0, 0, 0, 0],
	[Ln(0, 6, 1), 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0]
];
Fm7(ctlMatrix, modMatrix).first(2) * 0.1
