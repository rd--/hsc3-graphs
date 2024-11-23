// https://twitter.com/headcube/status/273708223440244736; nv
var n = {
	LFNoise1.kr(1 / 8)
};
RLPF.ar(
	Saw.ar([200, 302]).mean,
	5 ** n.value * 1000,
	0.6
) + RLPF.ar(
	Saw.ar(
		Amplitude.kr(
			3 ** n.value * 3000 * InFeedback.ar(0, 1) + 1,
			4,
			4
		)
	),
	1000,
	1
) / 5 ! 2
