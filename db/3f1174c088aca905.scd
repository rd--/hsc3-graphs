// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.1 ; sawtooth
var n = 10;
var f = { |i|
	var mult = (-1 ** i) * (0.5 / (i + 1));
	SinOsc.ar(440 * (i + 1), 0) * mult
};
Pan2.ar(Mix.ar(f.dup(n)), 0, 1 / n)
