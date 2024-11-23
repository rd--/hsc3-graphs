/* Pulsing bottles (Jmcc) */
let n = 6; /* Number of 'bottles' */
{
	EqPan2(
		Resonz(
			WhiteNoise(),
			400 + LinRand(0, 7000, 0),
			0.01
		),
		SinOsc(0.1 + 0.4.Rand0, (2 * pi).Rand0)
	) * LfPulse(4 + 10.Rand0, 0, 0.7.Rand0) * 0.8 / n
} !+ n
