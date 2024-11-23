/* A bath (Jrhb) ; requires=SelectX */
let above = MouseY(0, 2, 0, 0.2).RoundTo(1);
let aside = MouseX(1, 1.6, 0, 0.2);
let sources = [
	WhiteNoise(0.3 # 2, 0),
	PinkNoise(1 # 2, 0),
	LfdNoise3(10000) * 0.1
];
let u1 = SelectX(LfdNoise1(4).LinLin(-1, 1, 0, sources.size), sources) * 0.1;
let u2 = u1 + DelayN(u1, 0.1, [0.001, 0.0012]) * 0.1;
let u3 = { Rlpf(u2, { Rand(100.0, 340) * aside } ! 4, 0.2).Sum } ! 2;
let u4 = CombL(u3.reversed, 0.05, 0.05, 0.3) * 0.3 * LfNoise2(0.2).Max(0) + u3;
SelectX(Lag(above, 0.4), [u2, u4]) * 2
