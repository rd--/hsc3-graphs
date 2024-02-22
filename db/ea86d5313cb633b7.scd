// reso-pulse ; jmcc #1
var lfoFreq = 6;
var lfo = LFNoise0.kr(lfoFreq) * 1000 + 1200;
var left = RLPF.ar(
	OverlapTexture({
		var f = [25, 30, 34, 37, 41, 42, 46, 49, 53, 54, 58, 61, 63, 66].choose.midicps;
		LFPulse.ar(f, 0, 0.2) + LFPulse.ar(2 * f + Rand(-0.5, 0.5), 0, 0.2)
	}, 4, 2, 4, 1) * 0.02,
	lfo, // cutoff freq
	MouseX.kr(0.2, 0.02, 'exponential', 0.2) // filter bandwidth
);
var delayTime = 2 / lfoFreq;
var right = DelayN.ar(left, delayTime, delayTime); // delay right channel by two beats
[left, right]
