let n = 8;
let mX = MouseX(0, 1, 0, 0.1);
let mY = MouseY(0, 1, 0, 0.2);
let mWrap = { :pMin :pMax :min :max |
	(mX * ExpRand(pMin, pMax)).Sin + 1 * 0.5 * ExpRand(min, max)
};
let a = {
	let freq = mWrap(10, 40, 200, 5000) + ExpRand(200, 3000);
	let fMul = LfNoise0(ExpRand(0.1, 8)).RoundTo(1 / 6).ExpRange(1, Rand(1, 1.2));
	let phase = LfNoise2(mWrap(1, 20, 10, 1000)) * Rand(2, 5);
	SinOsc(freq * fMul, phase)
} ! n;
let b = OnePole({ PinkNoise() * 0.5 } ! 2, 0.4);
a.add(
	SinOsc(
		(LfdNoise0(11) * SetResetFf(Dust(1) * 0.3, Dust(1) * 0.3)).Range(0, 700) + 220,
		0
	)
);
SelectXFocus(mX * n, a, mY * n, false).Sum * 0.2 + b * Line(0, 1, 3)
