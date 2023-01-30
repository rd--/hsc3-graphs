// https://scsynth.org/t/7052 ; tmm881 ; rewrite
XFadeTexture({ arg tr;
	var freqMul = TRand.kr(0.5, 2, tr);
	var trigMul = TRand.kr(0.5, 2, tr);
	var env = {
		var freq = TChoose.kr(tr, [10, 5, 2.5]) * trigMul;
		Perc.ar([LFDClipNoise.ar(freq), LFDNoise0.ar(freq)], 0.01, 1, -4)
	};
	var snd = [
		SinOsc.ar([[48, 49]] * freqMul, 0) * env.value,
		Saw.ar(48 * 16 * freqMul) * env.value,
		Pulse.ar(48 * 32 * freqMul, 0.5) * env.value
	].sum.transpose.sum;
	var rev = FreeVerb.ar(snd, 0.33, 0.5, 0.5) + snd;
	CombC.ar(rev, 0.2, 0.2, 1) + rev * 0.1
}, 9, 2)
