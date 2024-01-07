(* Phasing Patterns ; https://github.com/lukiss/Losers-Union-SC-Research *)
let f = (48 + (0 .. 2).collect { :n |
	[0 -5 15 10] + (n * 12)
}.concatenation).MidiCps;
Splay(
	SinOsc(
		f,
		SinOsc(f * 2, 0) * (SinOsc(1 / f.arCosh / (SinOsc(1 / f, 0) * f), 0) * 8 + 8)
	) * (SinOsc(1.2 ^ f.normalizeSum, 0) ^ 1.5 * SinOsc(f.arcTan, 0)),
	SinOsc(1 / 8, 0)
) / 3
