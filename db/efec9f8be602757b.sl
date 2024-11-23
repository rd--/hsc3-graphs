/* Police state ; Jmcc ; requires=keywords */
let n = 4; /* number of sirens */
let node = {
	Pan2(
		in: SinOsc(
			freq: SinOsc(
				freq: 0.1.Rand0 + 0.02,
				phase: 2 * pi.Rand0
			) * 600.Rand0 + 1000 + 300.Rand2,
			phase: 0
		),
		pos: 1.Rand2,
		level: LfNoise2(freq: 100 + 20.Rand2) * 0.1
	)
};
let e = LfNoise2(
	freq: LfNoise2(
		freq: [0.4, 0.4]
	) * 90 + 620
) * (
	LfNoise2(
		freq: [0.3, 0.3]
	) * 0.15 + 0.18
);
CombL(
	in: node:/0 !+ 4 + e,
	maxDelayTime: 0.3,
	delayTime: 0.3,
	decayTime: 3
) * 0.5
