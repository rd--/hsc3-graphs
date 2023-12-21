// https://sccode.org/1-4Qy ; f0 ; 0333
Splay2.ar({ | i |
	var b = i + 2 * 99;
	var f = SinOscFB.ar(i + 1 / 150, 0).rounded + 1 + i * 99 + SinOscFB.ar([3, 2]);
	(Formant.ar(f, b, b) * SinOscFB.ar(i + 1 / 130, 0).max(0)).tanh
}.dup(8)) / 3
