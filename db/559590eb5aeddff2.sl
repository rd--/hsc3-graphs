;; nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.1 ; triangle
var n = 9;
var f = { :i |
	var harmonicnumber = 2 * i + 1;
	var mult = (-1 ** (harmonicnumber - 1 / 2)) * (1 / (harmonicnumber * harmonicnumber));
	SinOsc(440 * harmonicnumber, 0) * mult
};
Pan2(0.to(n).collect(f).sum, 0, 1 / n)
