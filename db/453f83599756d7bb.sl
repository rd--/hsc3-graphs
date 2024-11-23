/* Aleatoric quartet (Jmcc) #7 */
let amp = 0.07;
let density = MouseX(0.01, 1, 0, 0.1);
let dMul = density.Recip * 0.5 * amp;
let dAdd = amp - dMul;
let rapf = { :in |
	AllpassN(in, 0.05, { Rand(0, 0.05) } ! 2, 1)
};
let mkFreq = {
	let n0 = LfNoise0(Select(IRand(0, 2), [1, 0.5, 0.25]));
	Lag((n0 * 7 + 66 + Rand(-30, 30)).RoundTo(1), 0.2).MidiCps
};
let g = 1:4.collect { :ix |
	let x = PinkNoise() * (LfNoise1(8) * dMul + dAdd).Max(0);
	EqPan2(CombL(x, 0.02, mkFreq().Recip, 3), Rand(-1, 1))
}.Sum;
5.timesRepeat {
	g := rapf(g)
};
LeakDc(g, 0.995)
