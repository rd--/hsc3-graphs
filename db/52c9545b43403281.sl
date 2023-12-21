(* requires=kr ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html *)
var n = 11;
var z = {
	var freq = Rand(50, 560.3);
	var numCps = Rand(2, 20);
	var kNum = MulAdd(SinOsc(ExpRand(0.02, 0.2), 0), numCps / 2, numCps / 2);
	var osc = Gendy1(
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
