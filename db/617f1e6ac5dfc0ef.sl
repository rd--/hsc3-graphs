let k = 12;
let freq = SinOsc(
	{ Rand(0.01, 0.15) } ! k,
	{ Rand(0, 1) } ! k
).Range(777, 3333);
Splay(
	LeakDc(
		Pluck(
			WhiteNoise() / 4 ! k,
			Impulse({ Rand(3, 11) } ! k, 0),
			1 / 100,
			1 / freq,
			2,
			Rand(0.01, 0.2)
		),
		0.995
	)
)
