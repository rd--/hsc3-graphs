;; nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html ; requires=kr
var n = 11;
var f = {
	var freq = Rand(50, 560.3);
	var numcps = Rand(2, 20);
	var knum = MulAdd(SinOsc(ExpRand(0.02, 0.2),  0), numcps / 2,  numcps / 2);
	var osc = Gendy1(Rand(0, 6), Rand(0, 6), Rand(0, 1), Rand(0, 1), freq , freq,  Rand(0, 1),  Rand(0, 1),  numcps,  knum.kr);
	Pan2(osc,  Rand(-1, 1), 0.5 / n.sqrt)
};
Resonz(f !+ n, MouseX(100,  2000, 0, 0.2), MouseY(0.01,  1.0, 0, 0.2))
