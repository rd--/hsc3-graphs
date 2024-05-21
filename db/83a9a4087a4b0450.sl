{- https://sonomu.club/@lukiss/111749211970689312 ; Jan 14, 2024 -}
let p = [1, 5 .. 96];
let c = { :a :b :c |
	StandardL(a / pi, 1, 0.5, 0).Sin.LinLin(-1, 1, b, c)
};
let t = 2 ^ (c(5, 0, 4)).Floor;
let d = Latch((c(13, 1, 5)).Floor / t, TDuty(1 / t, 0, 1));
let l = {
	TChoose(
		TDuty(c(pi, 1 / t, 5) * d, 0, 1),
		[
			p * p.degree,
			p.DifSqr(p.shuffled),
			p * p.Log2,
			p.MidiRatio
		]
	)
};
let e = Perc(TDuty(d, 0, 1), d / t, d, 0);
let a = (e.LinCurve(0, 1, 1, 0, c(3, 2, -8)) * p).Log.Sin ^ c(13, 4, 36);
let b = (e > c(9, 0.003, 0.9)).Lag3(0.003);
Lpf(
	Splay(
		SinOsc(
			d * 55 * l(),
			SinOsc(l(), 0) * e * c(2.pi, 0, 2.pi)
		) * a * b,
		SinOsc(2.pi, 0) * e
	).Sanitize(0),
	9E3
)
