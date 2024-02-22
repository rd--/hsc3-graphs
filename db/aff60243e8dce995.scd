// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.1 ; square
var n = 10;
var f = { |i|
	var harmonicnumber = 2 * i + 1;
	SinOsc.ar(440 * harmonicnumber, 0) / harmonicnumber
};
Pan2.ar(Mix.ar(f.dup(n)), 0, 1 / n)
