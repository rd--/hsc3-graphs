{- <http://twitter.com/redFrik/status/1452954849885163525> (F0) ; reset (rd) -}
let tr = Impulse(1 / 9, 0);
let i = TRand(1, 64, tr);
let x = SinOsc(i % 9.33, 0).MulAdd(5, 5).Ceiling;
let t = SinOsc(2 ^ (i % 11) * 150 / x, 0);
let y = Hpz1(x).Abs > 0;
let f = t.ExpRange(
	Latch(LinExp(SinOsc(i % 4.4, 0), -1, 1, 9, 999), y),
	Latch(LinExp(SinOsc(i % pi, 0), -1, 1, 99, 9000), y)
);
let e = TLine(0.2, 0, 9, tr).Min(0.6) ^ 2;
EqPan(
	Blip(f, t + 2) * (1 - t),
	SinOsc(0.1, i)
) * e
