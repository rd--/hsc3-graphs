/* https://twitter.com/headcube/status/273708223440244736; nv ; kr... */
let n = {
	LfNoise1(1 / 8)
};
Rlpf(
	Saw([200, 302]).mean,
	5 ^ n() * 1000,
	0.6
) + Rlpf(
	Saw(
		Amplitude(
			3 ^ n() * 3000 * InFeedback(1, 0) + 1,
			4,
			4
		)
	),
	1000,
	1
) / 5 ! 2
