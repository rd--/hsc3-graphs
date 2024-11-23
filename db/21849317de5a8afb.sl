/* Harmonic swimming (Jmcc) #1 */
let l = Line(0, -0.02, 60);
1:20.collect { :h |
	let n = LfNoise1({ Rand(-4, 4) } ! 2 + 6) * 0.02 + l;
	SinOsc(50 * (h + 1), 0) * n.Max(0)
}.Sum
