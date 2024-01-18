{- 20060909 ; rd -}
let p = {
	let x = MouseX(0.001, 0.02, 1, 0.1);
	let y = MouseY(120, 400, 1, 0.1);
	let f = LfNoise0(4) * [32, 64];
	let w = LfNoise0(32) * x;
	let z = LfNoise0(2) * 0.1;
	let m = LfNoise0(6);
	let s = Pulse(f, w);
	Resonz(s, y + z, (m * 0.4) + 0.8) * 0.5
};
let q = {
	let n = LfNoise0(128);
	CombN(p(), 0.2, (n * 0.1) + 0.1, 3)
};
let r = {
	let x = MouseX(0.75, 1.25, 1, 0.1);
	let y = MouseY(0.25, 1, 1, 0.1);
	{
		{
			let fr = Rand(50, 59) * x;
			let am = Rand(0.04, 0.16) * y;
			SinOsc(fr, 0) * am
		} !+ 16
	} ! 2
};
p() + q() + r()
