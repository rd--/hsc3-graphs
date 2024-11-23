/* https://sonomu.club/@lukiss/111534001937293189 ; Dec 07, 2023 */
let t = TDuty(1 / (2 ^ Diwhite(inf, 0, 8)), 0, 1).kr;
let l = {
	let z = nil;
	TChoose(
		t,
		[0 .. 7].collect { :n |
			z := ((LfdNoise1(4) + 2 ^ n) / 16);
			SinOsc(z, 0).Sin
		}
	).Lag(0.25 / z).kr
};
let p = [1 .. 32];
let e = LfSaw(l() * p.MidiRatio, 1) * 0.5 + 0.5 ^ 8;
Splay(
	LeakDc(
		Blip(
			p * p.MidiRatio * TChoose(t, 2 * p.MidiCps),
			LfSaw(l(), 1).LinCurve(-1, 1, 1, LfSaw(l() * p.degree, 1) * 200 + 201, 8).kr
		) * e,
		0.995
	) * 0.25,
	l()
)
