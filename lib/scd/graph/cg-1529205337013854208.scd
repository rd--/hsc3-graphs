// https://twitter.com/SC2Sbot/status/1529205337013854208 (cg)
(1 .. 10).collect { | i |
	SinOscFB.ar(
		2000 / i - i,
		Pulse.ar([i / 4, i / 3], 0.5)
	)
}.sum / 10
