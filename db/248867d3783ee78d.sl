{- http://earslap.com/article/recreating-the-thx-deep-note.html ; inverting init sort, louder bass, final volume envelope, some little tweaks ; requires=CurveGen -}
let numVoices = 30;
let fundamentals = { 200.randomFloat(400) }.duplicate(numVoices).sorted.reversed;
let finalPitches = (1:numVoices.collect { :each |
	(each / (numVoices / 6)).RoundTo(1) * 12
} + 14.5).MidiCps;
let outerEnv = CurveGen(1, [0 0.1 1], [8 4], [2 4]);
let ampEnvelope = CurveGen(1, [0 1 1 0], [3 21 3], [2 0 -4]);
let snd = 1:numVoices.collect { :numTone |
	let initRandomFreq = fundamentals[numTone] + (LfNoise2(0.5) * 6 * (numVoices - numTone));
	let destinationFreq = finalPitches[numTone] + (LfNoise2(0.1) * numTone / 3);
	let sweepEnv = CurveGen(1, [0, Rand(0.1, 0.2), 1], [Rand(5.5, 6), Rand(8.5, 9)], [Rand(2, 3), Rand(4, 5)]);
	let freq = ((1 - sweepEnv) * initRandomFreq) + (sweepEnv * destinationFreq);
	EqPan(
		BLowPass(Saw(freq), freq * 6, 0.6),
		Rand(-1, 1)
	) * (1 - (1 / numTone)) * 1.5 / numVoices
}.Sum;
Limiter(BLowPass(snd, 2000 + (outerEnv * 18000), 0.5) * (2 + outerEnv) * ampEnvelope, 1, 0.01)
