;; LfNoise1
(1 .. 5).collect({ :n |
	EqPan2(
		SinOsc(n * 100, 0) * (LfNoise1(6) + Ln(1, -1, 30)).Max(0),
		Rand(-1, 1)
	)
}).sum * 0.025
