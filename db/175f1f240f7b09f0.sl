/* https://sonomu.club/@lukiss/111518889311136686 ; Dec 04, 2023 */
let t = TDuty(1 / (2 ^ Diwhite(inf, 0, 6)), 0, 1).kr;
let r = { :lo :hi |
	TRand(lo, hi, t)
};
let l = {
	let z = nil;
	TChoose(
		t,
		[0 .. 3].collect { :n |
			z := (LfNoise2(4).kr * 2 + 3 ^ n) / 4;
			SinOsc(z, 0).Sin
		}
	).Lag(1 / 8 / z)
};
let e = LfSaw(l() * r(1, 8), 1).kr + 1 / 2;
let f = r(24, 48).Ceiling.MidiCps;
let p = [1 .. 32];
let q = SinOsc(
	f * p * p.MidiRatio,
	SinOsc(p.MidiRatio ^ 2, 0) * (l() * 2 - e * 2 * pi)
) * ((e * p.MidiRatio).Log.Sin.Abs ^ r(4, 128));
let a = Splay(q.shuffled, SinOsc(r(0.5,8), 0));
let h = SinOsc(
	SinOsc([6, 7], 0) * (1 / 6) + 2 * f,
	0
) * (1 - e ^ 8) * r(1, 32);
let b = SinOsc(f, h) * (1.1 - e ^ 2) * 0.5;
(a + b).Sanitize(0)
