;; Fm7
var freq = LfNoise0(3).ExpRange(200, 310);
var ctlMatrix = [
	[freq, 0, 1],
	[freq, 0, 1],
	[LfNoise2(0.5).ExpRange(3, 80), 0, 1],
	[LfNoise2(0.5).ExpRange(3, 800), 0, 1],
	[LfNoise2(0.5).ExpRange(3, 800), 0, 1],
	[LfNoise2(0.5).ExpRange(0.3, 10), 0, 1]
];
var x = MouseX(0, 3, 0, 0.2);
var modMatrix = { { LfNoise1(0.5).Max(0) } ! 6 * x } ! 6;
Fm7(ctlMatrix, modMatrix).first(2) * -12.DbAmp
