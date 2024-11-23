/* ChaosGen writes melodies ; https://github.com/lukiss/Losers-Union-SC-Research ; https://sonomu.club/@lukiss/110751954599483552 */
let p = 0.5.coin.if {
	GbmanN([8 4 6 2], 1.2, 2.1).LinLin(-1, 1, 8, 32).Ceiling
} {
	StandardN([8 4 6 2], 1, 0.5, 0).LinLin(-1, 1, 12, 48).Ceiling
};
let f = DegreeToKey(
	[0 2 3 5 7 8 10].asLocalBuf,
	p,
	12
).MidiCps;
let m = SinOsc([8 4 0.5 1], 0);
let e = Perc(m, 0.001, 1 / 8, -4);
Splay(
	DelayC(
		FreeVerb(
			SinOsc(
				f,
				SinOsc(3 * f, 0) * e ^ 2 * (SinOsc(1.1 ^ 0:3 / 16, 0) * 2 + 3)
			) * e,
			m.Abs / 2,
			1 - m ^ 2 * 2,
			1 - m.ExpRange(0.01, 1)
		),
		0.2,
		m.Abs / 2048
	),
	m[3]
) / 2
