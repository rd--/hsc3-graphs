// input limiter
CompanderD.ar(
	SoundIn.ar([0,1]),
	MouseX.kr(0.01, 0.5), 		// threshold
	1, 		// below threshold slope
	0.1		// above threshold slope
)
