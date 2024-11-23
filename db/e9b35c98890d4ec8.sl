/* https://sonomu.club/@lukiss/111422385501420073 ; Nov 17, 2023 */
let x = CuspL(CuspL(3, 1, 1.9, 0).Exp * 12 + 1, 1, 1.9, 0).Fold2(1);
let t = (0 .. 7).collect { :n | PulseDivider(x, 8, 7 - n) };
let d = x.LinLin(-1, 1, 1 / 2, 2);
let e = { :c |
	Perc(t, 0.001, d, c)
};
let c = [0, 3, 7, -2];
let f = Demand(
	t,
	0,
	Dseq(inf, c) + Dxrand(inf, 48 + (0 .. 2).collect { :o | o * 12 + c }.flatten)
).MidiCps;
Splay(
	SinOsc(
		BrownNoise() * 0.0125 + 1 * f,
		(BrownNoise() * 0.4 * (SinOsc([3.25, 1 / 2, 2] * f, 0) * e(-58))).Sum
	) * e(-6) * (SinOsc(d + 2, 0) / 4 + 0.5),
	1 / 4
)
