(* Env ; requires=keywords *)
let e = Env(
	levels: [440 440 324 10000],
	times: [4 2 1],
	curves: 2,
	releaseNode: nil,
	loopNode: nil,
	offset: 0
);
let f = EnvGen(
	gate: 1,
	levelScale: 1,
	levelBias: 0,
	timeScale: 1,
	doneAction: 2,
	envelope: e.asArray
);
SinOsc(
	freq: f,
	phase: 0
) * 0.1
