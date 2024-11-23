/* Freezer ; Event control */
let sf = SfAcquireMono('Floating');
Voicer(1, 16) { :e |
	let incr = 1;
	let incrOff = 0;
	let incrRand = 0;
	let rightRand = 0.1;
	let phaseSync = 0;
	let phaseRand = 1;
	let numLp = 4;
	Freezer(
		sf,
		e.x * 0.75,
		e.x * (0.75 + (e.y * 0.1)),
		e.y,
		[incr * (1 - e.z), incr * (1 - e.i)],
		incrOff,
		incrRand,
		rightRand + (e.y * 0.1),
		phaseSync,
		phaseRand,
		numLp
	) * e.z * e.w
}.Sum
