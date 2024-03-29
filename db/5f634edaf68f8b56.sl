{- Pulse harmonic warbulence (Jmcc) #12 -}
let z = { :tr |
	let f = TRand(24, 96, tr).MidiCps;
	let r = TxLine(TExpRand(0.1, 20, tr), TExpRand(0.1, 20, tr), 25.6, tr);
	let n = 12;
	let p = LfPulse(TExpRand(0.2, 1.2, tr), TRand(0.1, 0.2, tr), 0.5);
	1:n.collect { :i |
		let m = SinOsc(r * TRand(0.9, 1.1, tr), TRand(0, 2 * pi, tr)) * 0.1 - 0.05;
		EqPan2(SinOsc(f * i + f, 0) * m.Max(0), TRand(-1, 1, tr)) / (i + 1)
	}.Sum * p
}.OverlapTexture(12.8, 6.4, 6).Mix;
{
	CombN(z, 0.3, { Rand(0.1, 0.3) } ! 2, 8)
} !+ 5 * 0.25
