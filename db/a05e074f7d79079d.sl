/* tw 0134 (f0) */
let n = 50;
1:n.collect { :i |
	Ringz(
		Blip(LfSaw(i + 1 / [3, 4], 0) > (LfSaw(i + 1 / 8, 0) + 1) * (n / 2) + n, i + [2, 3]) *
		LfSaw(i + 1 / n, i / (n / 2)), i + 1 * (n * 2 - 1),
		0.1
	)
}.mean / 5
