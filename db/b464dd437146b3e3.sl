(* http://earslap.com/article/recreating-the-thx-deep-note.html ; adding random wobbling to freqs, sorting randoms, lowpassing ; fundamentals are sorted, so higher frequencies drift more *)
var numVoices = 30;
var fundamentals = { 200.randomFloat(400) }.duplicate(numVoices).sorted;
fundamentals.withIndexCollect { :freq0 :index |
	var freq = freq0 + (LfNoise2(0.5) * 3 * index);
	EqPan(
		BLowPass(Saw(freq), freq * 5, 0.5),
		Rand(-1, 1)
	) * numVoices.reciprocal
}.Sum
