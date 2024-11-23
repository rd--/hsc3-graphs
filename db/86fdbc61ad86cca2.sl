/* 20061027 ; rd */
let h0 = {
	let f = 40;
	let h = HenonN(
		[f, f * 0.5],
		LfNoise0(1) * 0.2 + 1.2,
		LfNoise0(1) * 0.15 + 0.15,
		0,
		0
	);
	Saw(h * 3200 + 1600) * 0.35
};
let h1 = {
	let n = LfNoise0(2);
	let p = n.LinLin(-1, 1, 2400, 3200);
	let o = Blip(
		HenonN(
			40,
			MouseX(1.2, 1.4, 0, 0.1),
			MouseY(0.2, 0.3, 0, 0.1),
			0,
			0
		).LinLin(-1, 1, p, p * 2),
		LfNoise0(32).LinLin(-1, 1, 1, 32)
	);
	EqPan(
		o,
		n.LinLin(-1, 1, -0.75, 0.75)
	) * n.LinLin(-1, 1, 0.55, 0.85) * 0.35
};
h0() + h1()
