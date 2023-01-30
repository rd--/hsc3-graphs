;; nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.1 ; square
var n = 9;
var f = { :i |
	var harmonicnumber = 2 * i + 1;
	SinOsc(440 * harmonicnumber, 0) / harmonicnumber
};
Pan2(0.to(n).collect(f).sum, 0, 1 / n)
