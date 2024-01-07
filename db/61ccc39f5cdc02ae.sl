(* http://earslap.com/article/recreating-the-thx-deep-note.html ; 30 oscillators together, distributed across the stereo field *)
let numVoices = 30;
let fundamentals = { Rand(200, 400) } ! numVoices;
fundamentals.collect { :freq |
	EqPan(
		Saw(freq),
		Rand(-1, 1)
	) * numVoices.reciprocal
}.Sum
