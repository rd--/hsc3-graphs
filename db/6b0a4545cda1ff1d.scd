// https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 1.1
var n = 11;
var mk = {
	var freq = Rand(50, 560.3);
	var numcps = Rand(2, 20);
	var knum = SinOsc.kr(ExpRand(0.02, 0.2), 0, numcps / 2, numcps / 2);
	var gen = Gendy1.ar(IRand(0, 6), IRand(0, 6), Rand(0, 1), Rand(0, 1), freq, freq, Rand(0, 1), Rand(0, 1), numcps, knum, 0.5 / n.sqrt);
	Pan2.ar(gen, Rand(-1, 1), 1.0)
};
var x = MouseX.kr(100, 2000, 0, 0.2);
var y = MouseY.kr(0.01, 1.0, 0, 0.2);
Resonz.ar(mk.dup(n).sum, x, y, 0.5)
