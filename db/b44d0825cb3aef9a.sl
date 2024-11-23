/* http://earslap.com/article/sctweeting.html */
{
	let a = LfNoise1(Rand(0, 0.2));
	DelayC(
		Bpf(
			WhiteNoise() * Dust2(a * a * 4 ^ 2).Lag(0.008),
			IRand(0, 10000) + 300,
			0.09
		),
		3,
		a * 1.5 + 1.5
	) * 45
} !+ 80
