;; http://earslap.com/article/recreating-the-thx-deep-note.html ; inverting init sort, louder bass, final volume envelope, some little tweaks ; requires=CurveGen
var numVoices = 30;
var fundamentals = { 200.randomFloat(400) }.dup(numVoices).sorted.reversed;
var finalPitches = ((1 .. numVoices).collect { :each | (each / (numVoices / 6)).RoundTo(1) * 12 } + 14.5).MidiCps;
var outerEnv = CurveGen(1, [0, 0.1, 1], [8, 4], [2, 4]);
var ampEnvelope = CurveGen(1, [0, 1, 1, 0], [3, 21, 3], [2, 0, -4]);
var voiceFunc = { :numTone |
	var initRandomFreq = fundamentals[numTone] + (LfNoise2(0.5) * 6 * (numVoices - numTone));
	var destinationFreq = finalPitches[numTone] + (LfNoise2(0.1) * numTone / 3);
	var sweepEnv = CurveGen(1, [0, Rand(0.1, 0.2), 1], [Rand(5.5, 6), Rand(8.5, 9)], [Rand(2, 3), Rand(4, 5)]);
	var freq = ((1 - sweepEnv) * initRandomFreq) + (sweepEnv * destinationFreq);
	EqPan2(
		BLowPass(Saw(freq), freq * 6, 0.6),
		Rand(-0.5, 0.5)
	) * (1 - (1 / numTone)) * 1.5 / numVoices
};
var snd = (1 .. numVoices).collect(voiceFunc).sum;
Limiter(BLowPass(snd, 2000 + (outerEnv * 18000), 0.5) * (2 + outerEnv) * ampEnvelope, 1, 0.01)
