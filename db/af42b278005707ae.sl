(* tutorial 2.1 ; sawtooth *)
var n = 9;
(0 .. n).collect { :i |
	var mult = (-1 ^ i) * (0.5 / (i + 1));
	SinOsc(440 * (i + 1), 0) * mult
}.Sum / n
