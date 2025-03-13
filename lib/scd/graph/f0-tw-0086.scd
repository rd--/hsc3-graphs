// https://fredrikolofsson.com/f0blog/sapf-sctweets/ ; 0086
var a = LFNoise2.kr(1 / (9 .. 17));
Splay.ar(
	Ringz.ar(
		BPF.ar(
			Dust2.ar(a.abs * 1E4),
			a.linexp(-1, 1, 99, 1E4),
			1.1 - a
		),
		(9 .. 1) * 99,
		a + 1.1
	) * a / 5
)
