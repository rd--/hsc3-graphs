/* https://sonomu.club/@lukiss/111534969935581348 ; Dec 7, 2023 */
let p = {
	let a = 0:3.collect { :n |
		n * 12 + [0 3 7 10]
	}.flatten - 24;
	SinOsc(5, 0) * 0.01 + a.shuffled.MidiRatio
};
let e = LfSaw(-1 * p(), 1).Max(0) ^ SinOsc(p().Frac / 8, 0).LinLin(-1, 1, 4, 32);
CombC(
	Splay(
		VarSaw(
			147 * p(),
			0,
			LfSaw(
				p().degree,
				1
			) * (1 / 4) + (1 / 4)
		) * e.Sanitize(0),
		SinOsc(1 / 3, 0)
	),
	0.2, 0.2, 1
)
