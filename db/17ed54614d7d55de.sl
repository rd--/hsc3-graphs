;; nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.1 ; sawtooth
var n = 9;
var f = { :i |
	var mult = (-1 ** i) * (0.5 / (i + 1));
	SinOsc(440 * (i + 1), 0) * mult
};
Pan2(0.to(n).collect(f).sum, 0, 1 / n)
