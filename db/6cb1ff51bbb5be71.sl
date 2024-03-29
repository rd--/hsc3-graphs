{- http://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 1.1 -}
let n = 11;
let g = {
	let freq = Rand(50, 560.3);
	let numcps = Rand(2, 20);
	let knum = SinOsc(ExpRand(0.02, 0.2), 0) * (numcps / 2) + (numcps / 2);
	let gen = Gendy1(
		IRand(0, 6),
		IRand(0, 6),
		Rand(0, 1),
		Rand(0, 1),
		freq,
		freq,
		Rand(0, 1),
		Rand(0, 1),
		numcps,
		knum
	);
	EqPan(gen, Rand(-1, 1)) * 0.5 / n.sqrt
} !+ n;
let x = MouseX(100, 2000, 0, 0.2);
let y = MouseY(0.01, 1.0, 0, 0.2);
Resonz(g, x, y) * 0.5
