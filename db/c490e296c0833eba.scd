// http://earslap.com/article/recreating-the-thx-deep-note.html ; 30 oscillators together, distributed across the stereo field
var numVoices = 30;
var fundamentals = { Rand(200, 400) }.dup(numVoices);
fundamentals.collect({
	arg freq;
	Pan2.ar(
		Saw.ar(freq),
		Rand(-0.5, 0.5),
		numVoices.reciprocal
	)
}).sum
