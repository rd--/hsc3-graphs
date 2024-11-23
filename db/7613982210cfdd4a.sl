/* requires=kr ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html */
let n = 11;
let z = {
	let freq = Rand(50, 560.3);
	let numCps = Rand(2, 20);
	let kNum = MulAdd(SinOsc(ExpRand(0.02, 0.2), 0), numCps / 2, numCps / 2);
	let osc = Gendy1(
		Rand(0, 6),
		Rand(0, 6),
		Rand(0, 1),
		Rand(0, 1),
		freq,
		freq,
		Rand(0, 1),
		Rand(0, 1),
		numCps,
		kNum.kr
	);
	Pan2(osc, Rand(-1, 1), 0.5 / n.sqrt)
} !> n;
Resonz(z, MouseX(100, 2000, 0, 0.2), MouseY(0.01, 1.0, 0, 0.2))
