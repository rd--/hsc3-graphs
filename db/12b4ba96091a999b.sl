;; why supercollider (jmcc) #0 ; keywords
var s = {
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
var z = DelayN(
	in: s,
	maxdelaytime: 0.048,
	delaytime: 0.048
);
var x = {
	CombL(
		in: z,
		maxdelaytime: 0.1,
		delaytime: LfNoise1(
			freq: Rand(
				lo: 0,
				hi: 0.1
			)
		) * 0.04 + 0.05,
		decaytime: 15
	)
} !+ 7;
4.timesRepeat {
	x := AllpassN(
		in: x,
		maxdelaytime: 0.050,
		delaytime: {
			Rand(
				lo: 0,
				hi: 0.05
			)
		} ! 2,
		decaytime: 1
	)
};
s + (x * 0.2)
