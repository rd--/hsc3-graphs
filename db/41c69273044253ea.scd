// https://scsynth.org/t/7055 ; tmm881 ; rewrite for clarity &etc.
var mouse = [
	MouseX.kr(0, 1, 0, 0.2),
	MouseY.kr(0, 1, 0, 0.2)
];
var tendencyMask = [
	XLine.kr(0.5, 50, 300),
	XLine.kr(0.25, 25, 600),
	XLine.kr(0.125, 12.5, 900)
];
{
	var modRate = {
		TRand.kr(
			pi / 2,
			pi,
			Impulse.kr(TRand.kr(pi / 2, pi, Impulse.kr(pi / 2, 0)), 0)
		)
	} ! 3;
	var mod = {
		TRand.kr(
			tendencyMask * 0.125,
			tendencyMask * 4,
			Impulse.kr(tendencyMask * modRate, 0)
		)
	} ! 2;
	var dur = (0 .. 2).collect { arg i;
		Rand.ir(0.25, 4) * mod[0][i] * (mouse + 0.1).choose
	};
	var triggerRate = (0 .. 2).collect { arg i;
		Rand.ir(0.25, 4) * mod[1][i] * (mouse / 10 + 0.1).choose
	};
	var freqMul = {
		(mouse * 10 + 0.1).choose
	} ! 3;
	var dry = (0 .. 2).collect({ arg i;
		var freqRange = 10 ** i * [22, 88] * freqMul[i];
		var freq = {
			TRand.ar(
				freqRange[0],
				freqRange[1],
				Impulse.ar(triggerRate[i], 0)
			) + [0, Rand.ir(-1, 1)]
		} ! 2;
		var tr = Impulse.ar(triggerRate[i], 0);
		GrainFM.ar(2, tr, dur[i], freq[0], freq[1], 1, WhiteNoise.ar() * 0.6, -1, 512) * 0.1
	}).sum;
	var rev = FreeVerb.ar(dry, 0.33, 0.5, 0.5);
	var del = CombC.ar(dry, 0.2, 0.2, 1);
	dry + rev + del * 0.2
}.dup(4).sum.transpose.sum
