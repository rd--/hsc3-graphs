/* Why supercollider? (Jmcc) #0 ; requires=keywords */
let s = {
	Resonz(
		in: Dust(
			density: 0.2
		) * 50,
		freq: Rand(
			lo: 200,
			hi: 3200
		),
		bwr: 0.003
	)
} !+ 10;
let z = DelayN(
	in: s,
	maxDelayTime: 0.048,
	delayTime: 0.048
);
let x = {
	CombL(
		in: z,
		maxDelayTime: 0.1,
		delayTime: LfNoise1(
			freq: Rand(
				lo: 0,
				hi: 0.1
			)
		) * 0.04 + 0.05,
		decayTime: 15
	)
} !+ 7;
4.timesRepeat {
	x := AllpassN(
		in: x,
		maxDelayTime: 0.050,
		delayTime: {
			Rand(
				lo: 0,
				hi: 0.05
			)
		} ! 2,
		decayTime: 1
	)
};
s + (x * 0.2)
