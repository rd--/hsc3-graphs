// http://earslap.com/article/recreating-the-thx-deep-note.html ; inverting init sort, louder bass, final volume envelope, some little tweaks
var numVoices = 30;
var fundamentals = { 200.0.rand(400.0) }.dup(numVoices).sort.reverse;
var finalPitches = (numVoices.collect({ arg each; (each / (numVoices / 6)).round * 12 }) + 14.5 ).midicps;
var outerEnv = CurveGen.kr(1, [0, 0.1, 1], [8, 4], [2, 4]);
var ampEnvelope = CurveGen.kr(1, [0, 1, 1, 0], [3, 21, 3], [2, 0, -4]);
var voiceFunc = {
	arg numTone;
	var initRandomFreq = fundamentals[numTone] + (LFNoise2.kr(0.5) * 6 * (numVoices - (numTone + 1)));
	var destinationFreq = finalPitches[numTone] + (LFNoise2.kr(0.1) * numTone / 3);
	var sweepEnv = CurveGen.kr(1, [0, Rand.ir(0.1, 0.2), 1], [Rand.ir(5.5, 6), Rand.ir(8.5, 9)], [Rand.ir(2, 3), Rand.ir(4, 5)]);
	var freq = ((1 - sweepEnv) * initRandomFreq) + (sweepEnv * destinationFreq);
	Pan2.ar(
		BLowPass.ar(Saw.ar(freq), freq * 6, 0.6),
		-0.5.rrand(0.5),
		(1 - (1 / (numTone + 1))) * 1.5
	) / numVoices
};
var snd = (0 .. numVoices - 1).collect(voiceFunc).sum;
Limiter.ar(BLowPass.ar(snd, 2000 + (outerEnv * 18000), 0.5) * (2 + outerEnv) * ampEnvelope, 1, 0.01)
