/* Jmcc ; Rethinking ; https://doi.org/10.1162/014892602320991383 */
let numberOfExciters = 10;
let numberOfCombs = 7;
let numberOfAllpass = 4;
let exciterFunction = {
	Resonz(
		Dust(0.2) * 50,
		200 + Rand(0, 3000),
		0.003
	)
};
let in = exciterFunction:/0 !+ numberOfExciters;
let predelayed = DelayN(in, 0.048, 0.048);
let out = {
	CombL(
		predelayed,
		0.1,
		LfNoise1(Rand(0, 0.1)) * 0.04 + 0.05,
		15
	)
} !+ numberOfCombs;
numberOfAllpass.timesRepeat {
	out := AllpassN(
		out,
		0.050,
		[Rand(0, 0.050), Rand(0, 0.050)],
		1
	)
};
in + (0.2 * out)
