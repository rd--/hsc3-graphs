// clustered sines (jmcc)

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~xfade_texture.({
	var n = 80;
	var f1 = 100 + 1000.0.rand;
	var f2 = 4.0 * f1;
	var z = Array.fill(2, {
		`[	// sine oscil bank specification :
			y = Array.fill(n, { f1 + f2.rand} ), // frequencies
			f1 / y,	// amplitudes
			nil	// phases default to zero
		]
	});
	Klang.ar(z, 1, 0) * (0.3/n);
}, 4, 4);
