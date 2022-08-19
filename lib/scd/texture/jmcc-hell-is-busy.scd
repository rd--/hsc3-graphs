// hell is busy (jmcc) #1
{
	var e = LFPulse.kr(1 + 10.0.rand, 0, 0.7.rand) * 0.04;
	Pan2.ar(SinOsc.ar(400 + 2000.0.rand, 0) * e, 1.0.rand2, 1)
}.overlap(4, 4, 8)

// hell is busy (jmcc) #1 ; keywords
Texture.overlapRoutine({
	var e = LFPulse.kr(freq: 1 + 10.0.rand, iphase: 0, width: 0.7.rand, mul: 0.04); /* amplitude envelope */
	Pan2.ar(in: FSinOsc.ar(freq: 400 + 2000.0.rand, iphase: 0, mul: e), pos: 1.0.rand2, level: 1)
}, sustainTime: 4, transitionTime: 4, overlap: 8) /* overlap = number of simultaneous events */
