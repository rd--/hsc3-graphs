/* Bezier ; dynamic shifting of control points, as oscillator */
let w = { :l :r |
	LinLin(LfdNoise3(2), -1, 1, l, r)
};
{
	let p = [
		0, 0,
		w(0.05, 0.25), -1.3,
		w(0.25, 0.45), -1.3,
		0.5, 0,
		w(0.55, 0.75), 1.3,
		w(0.75, 0.95), 1.3,
		1, 0
	];
	let o = Bezier(100, 0.001, w(200, 205), 0, p);
	EqPan2(o, IRand(-1, 1)) * 0.1
} !> 4
