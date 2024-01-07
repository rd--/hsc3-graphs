let prob = MouseX(0, 0.65, 0, 0.2);
let trig = Impulse(20, 0) * (SinOsc(0.5, 0) + 1);
{
	Ringz(
		CoinGate(prob, trig * 0.5),
		[1, 1.5] * Rand(1000, 9000),
		0.01
	)
} !+ 3
