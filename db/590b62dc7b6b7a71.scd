// Bezier ; mouse control of frequency
var x = MouseX.kr(minval: 40, maxval: 4000, warp: 'exponential', lag: 0.2);
Bezier.ar(
	freq: x,
	phase: 0,
	param: [0, 0, 0.2, -1.3, 0.3, -1.3, 0.5, 0, 0.7, 1.3, 0.8, 1.3, 1, 0]
) * 0.1
