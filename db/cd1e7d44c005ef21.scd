// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.1 ; triangle
var n = 10;
var f = { |i|
	var harmonicnumber = 2 * i + 1;
	var mult = (-1 ** (harmonicnumber - 1 / 2)) * (1 / (harmonicnumber * harmonicnumber));
	SinOsc.ar(440 * harmonicnumber, 0) * mult
};
Pan2.ar(Mix.ar(f.dup(n)), 0, 1 / n)
