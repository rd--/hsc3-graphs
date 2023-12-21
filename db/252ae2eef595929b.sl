(* http://earslap.com/article/recreating-the-thx-deep-note.html ; 30 oscillators together, distributed across the stereo field *)
var numVoices = 30;
var fundamentals = { Rand(200, 400) } ! numVoices;
fundamentals.collect { :freq |
	EqPan(
		Saw(freq),
		Rand(-1, 1)
	) * numVoices.reciprocal
}.Sum
