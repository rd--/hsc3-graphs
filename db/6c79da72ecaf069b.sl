let mouseAzimuth = MouseX(0, 2 * pi, 0, 0.2);
let mouseRho = MouseY(0, 4, 0, 0.2);
let cycleAzimuth = LfSaw(1 / 4, 0).LinLin(-1, 1, 0, 2 * pi);
let [w, x, y, z] = BfEncode1(
	PinkNoise(),
	cycleAzimuth, /* mouseAzimuth */
	0,
	1, /* mouseRho */
	0.3,
	0
);
BfDecode1(w, x, y, z, [-0.75 -0.5 -0.25 0 0.25 0.5 0.75 1] * pi, 0, 0)
