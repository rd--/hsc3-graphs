// http://earslap.com/article/recreating-the-thx-deep-note.html ; adding random wobbling to freqs, sorting randoms, lowpassing ; fundamentals are sorted, so higher frequencies drift more.
var numVoices = 30;
var fundamentals = { 200.0.rrand(400.0) }.dup(numVoices).sort;
fundamentals.collect { |freq0 index|
	var freq = freq0 + (LFNoise2.kr(0.5) * 3 * index);
	Pan2.ar(
		BLowPass.ar(Saw.ar(freq), freq * 5, 0.5),
		Rand.ir(-0.5, 0.5),
		numVoices.reciprocal
	)
}.sum
