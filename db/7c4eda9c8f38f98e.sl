(* Freezer ; event control *)
let sf = SfAcquireMono('floating_1');
Voicer(1, 16) { :e |
	let incr=1, incrOff=0, incrRand=0, rightRand=0.1, phaseSync=0, phaseRand=1, numLp=4;
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
